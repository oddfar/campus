package com.oddfar.campus.framework.web.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.extra.spring.SpringUtil;
import com.oddfar.campus.common.constant.CacheConstants;
import com.oddfar.campus.common.constant.Constants;
import com.oddfar.campus.common.core.RedisCache;
import com.oddfar.campus.common.domain.entity.SysUserEntity;
import com.oddfar.campus.common.domain.event.LogininforEvent;
import com.oddfar.campus.common.domain.model.LoginUser;
import com.oddfar.campus.common.exception.ServiceException;
import com.oddfar.campus.common.exception.user.CaptchaException;
import com.oddfar.campus.common.exception.user.CaptchaExpireException;
import com.oddfar.campus.common.exception.user.UserPasswordNotMatchException;
import com.oddfar.campus.common.utils.MessageUtils;
import com.oddfar.campus.common.utils.ServletUtils;
import com.oddfar.campus.common.utils.StringUtils;
import com.oddfar.campus.common.utils.ip.IpUtils;
import com.oddfar.campus.common.utils.web.WebFrameworkUtils;
import com.oddfar.campus.framework.security.context.AuthenticationContextHolder;
import com.oddfar.campus.framework.service.SysConfigService;
import com.oddfar.campus.framework.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 登录校验方法
 *
 * @author ruoyi
 */
@Component
public class SysLoginService {
    @Autowired
    private TokenService tokenService;

    @Resource
    private AuthenticationManager authenticationManager;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private SysUserService userService;

    @Autowired
    private SysConfigService configService;

    /**
     * 登录验证
     *
     * @param username 用户名
     * @param password 密码
     * @param code     验证码
     * @param uuid     唯一标识
     * @return 结果
     */
    public String login(String username, String password, String code, String uuid) {
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        // 验证码开关
        if (captchaEnabled) {
            validateCaptcha(username, code, uuid);
        }
        // 用户验证
        Authentication authentication = null;
        try {
            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
            AuthenticationContextHolder.setContext(authenticationToken);
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager.authenticate(authenticationToken);
        } catch (Exception e) {
            if (e instanceof BadCredentialsException) {
                //异步执行->保存登录信息
                LogininforEvent logininforEvent = new LogininforEvent();
                logininforEvent.setUsername(username);
                logininforEvent.setStatus(Constants.LOGIN_FAIL);
                logininforEvent.setMessage(MessageUtils.message("user.password.not.match"));
                logininforEvent.setRequest(ServletUtils.getRequest2());
                SpringUtil.getApplicationContext().publishEvent(logininforEvent);
                throw new UserPasswordNotMatchException();
            } else {
                //异步执行->登录信息
                LogininforEvent logininforEvent = new LogininforEvent();
                logininforEvent.setUsername(username);
                logininforEvent.setStatus(Constants.LOGIN_FAIL);
                logininforEvent.setMessage(e.getMessage());
                logininforEvent.setRequest(ServletUtils.getRequest2());
                SpringUtil.getApplicationContext().publishEvent(logininforEvent);
                e.printStackTrace();
                throw new ServiceException(e.getMessage());
            }
        } finally {
            AuthenticationContextHolder.clearContext();
        }
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        // 额外设置到 request 中，有的过滤器在 Spring Security 之前
        WebFrameworkUtils.setLoginUserId(ServletUtils.getRequest(), loginUser.getUserId());
        //记录登录信息
        recordLoginInfo(username, loginUser.getUserId(), Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success"));
        // 生成token
        return tokenService.createToken(loginUser);
    }

    /**
     * 校验验证码
     *
     * @param username 用户名
     * @param code     验证码
     * @param uuid     唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid) {
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null) {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha)) {
            throw new CaptchaException();
        }
    }

    /**
     * 更新登录信息
     *
     * @param userId 用户ID
     */
    public void recordLoginInfo(String username, Long userId, String status, String message) {
        SysUserEntity sysUser = new SysUserEntity();
        sysUser.setUserId(userId);
        sysUser.setLoginIp(IpUtils.getIpAddr(ServletUtils.getRequest()));
        sysUser.setLoginDate(DateUtil.date());
        userService.updateUserProfile(sysUser);
        //异步记录登录成功日志
        LogininforEvent logininforEvent = new LogininforEvent();
        logininforEvent.setUsername(username);
        logininforEvent.setUserId(userId);
        logininforEvent.setStatus(status);
        logininforEvent.setMessage(message);
        logininforEvent.setRequest(ServletUtils.getRequest2());
        SpringUtil.getApplicationContext().publishEvent(logininforEvent);
    }
}
