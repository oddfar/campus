package com.oddfar.campus.framework.security.handle;

import cn.hutool.extra.spring.SpringUtil;
import com.alibaba.fastjson2.JSON;
import com.oddfar.campus.common.constant.Constants;
import com.oddfar.campus.common.constant.HttpStatus;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.domain.event.LogininforEvent;
import com.oddfar.campus.common.domain.model.LoginUser;
import com.oddfar.campus.common.utils.MessageUtils;
import com.oddfar.campus.common.utils.ServletUtils;
import com.oddfar.campus.common.utils.StringUtils;
import com.oddfar.campus.framework.web.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 自定义退出处理类 返回成功
 *
 * @author ruoyi
 */
@Configuration
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler {
    @Autowired
    private TokenService tokenService;

    /**
     * 退出处理
     */
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {
        LoginUser loginUser = tokenService.getLoginUser(request);
        if (StringUtils.isNotNull(loginUser)) {
            // 删除用户缓存记录
            tokenService.delLoginUser(loginUser.getToken());
            // 记录用户退出日志
            recordLogoutInfo(loginUser.getUsername(), loginUser.getUserId(), Constants.LOGOUT, MessageUtils.message("user.logout.success"),request);
        }
        ServletUtils.renderString(response, JSON.toJSONString(R.error(HttpStatus.SUCCESS, MessageUtils.message("user.logout.success"))));
    }

    /**
     * 记录用户退出日志
     *
     * @param username 用户名
     * @param userId   用户Id
     * @param status   状态
     * @param message  消息内容
     */
    private void recordLogoutInfo(String username, Long userId, String status, String message,HttpServletRequest request) {
        LogininforEvent logininforEvent = new LogininforEvent();
        logininforEvent.setUsername(username);
        logininforEvent.setUserId(userId);
        logininforEvent.setStatus(status);
        logininforEvent.setMessage(message);
        logininforEvent.setRequest(request);
        SpringUtil.getApplicationContext().publishEvent(logininforEvent);
    }
}
