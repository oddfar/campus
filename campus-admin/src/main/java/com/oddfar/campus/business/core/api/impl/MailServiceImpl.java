package com.oddfar.campus.business.core.api.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.IdUtil;
import com.oddfar.campus.business.core.api.MailServiceApi;
import com.oddfar.campus.business.core.constant.CampusConstant;
import com.oddfar.campus.common.constant.CacheConstants;
import com.oddfar.campus.common.core.RedisCache;
import com.oddfar.campus.common.domain.entity.SysUserEntity;
import com.oddfar.campus.common.domain.model.RegisterBody;
import com.oddfar.campus.common.exception.ServiceException;
import com.oddfar.campus.common.exception.user.CaptchaException;
import com.oddfar.campus.common.exception.user.CaptchaExpireException;
import com.oddfar.campus.common.utils.SecurityUtils;
import com.oddfar.campus.common.utils.ServletUtils;
import com.oddfar.campus.common.utils.StringUtils;
import com.oddfar.campus.framework.api.mail.MailSendContext;
import com.oddfar.campus.framework.api.sysconfig.ConfigContext;
import com.oddfar.campus.framework.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.common.TemplateParserContext;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class MailServiceImpl implements MailServiceApi {

    @Autowired
    private SysUserService userService;
    @Autowired
    private RedisCache redisCache;

    @Override
    public void bindMail(RegisterBody registerBody) {
        //检测验证码
        validateCaptcha(registerBody.getCode(), registerBody.getUuid());
        validateEmail(registerBody.getEmail());


        String username = SecurityUtils.getUsername();
        registerBody.setUsername(username);
        String uuid = IdUtil.simpleUUID();
        String url = ServletUtils.getRequest().getHeader("Origin") + "/email-validate/" + uuid;


        Map<String, Object> params = new HashMap<>();
        params.put("userName", username);
        params.put("expiration", CampusConstant.BIND_MAIL_EXPIRATION);
        params.put("url", url);

        String template = ConfigContext.me().selectConfigByKey("campus.mail.bindTemplate", String.class);

        ExpressionParser parser = new SpelExpressionParser();
        TemplateParserContext parserContext = new TemplateParserContext();
        String content = parser.parseExpression(template, parserContext).getValue(params, String.class);

        // 存入到redis 邮箱、验证码、时间、单位
        redisCache.setCacheObject(getCheckKey(registerBody.getEmail()), registerBody.getEmail(),
                CampusConstant.REGISTER_REPEAT_EXPIRATION, TimeUnit.MINUTES);

        redisCache.setCacheObject(getBindKey(uuid), registerBody,
                CampusConstant.BIND_MAIL_EXPIRATION, TimeUnit.MINUTES);
        try {
            // 发送邮件
            MailSendContext.me().sendQQMail(CollUtil.newArrayList(registerBody.getEmail()),
                    "邮箱绑定", content, true);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException("发送邮件失败");
        }
    }

    @Override
    public boolean checkEmailCode(String email) {

        return redisCache.hasKey(getCheckKey(email));
    }

    @Override
    public boolean emailValidate(String uuid) {
        if (redisCache.hasKey(getBindKey(uuid))) {
            RegisterBody registerBody = redisCache.getCacheObject(getBindKey(uuid));
            redisCache.deleteObject(getBindKey(uuid));
            SysUserEntity userEntity = userService.selectUserByUserName(registerBody.getUsername());
            userEntity.setEmail(registerBody.getEmail());
            userService.updateUser(userEntity);
            return true;
        } else {
            return false;
        }

    }

    /**
     * 自定义封装的模板替换
     *
     * @param template
     * @param params
     * @return
     */
    public static String processTemplate(String template, Map params) {
        StringBuffer sb = new StringBuffer();
        Matcher m = Pattern.compile("\\$\\{\\w+\\}").matcher(template);
        while (m.find()) {
            String param = m.group();
            Object value = params.get(param.substring(2, param.length() - 1));
            m.appendReplacement(sb, value == null ? "" : value.toString());
        }
        m.appendTail(sb);
        return sb.toString();
    }

    /**
     * 校验邮箱
     *
     * @param email
     */
    public void validateEmail(String email) {
        if (!isEmail(email)) {
            throw new ServiceException("请输入正确格式的邮箱");
        }
        SysUserEntity userEntity = new SysUserEntity();
        userEntity.setEmail(email);
        if (StringUtils.isNotEmpty(email)
                && !(userService.checkEmailUnique(userEntity))) {
            throw new ServiceException("发送失败，邮箱账号已存在");
        }

        if (checkEmailCode(email)) {
            throw new ServiceException("两次间隔不能小于1分");
        }
    }

    /**
     * 校验验证码
     *
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String code, String uuid) {
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

    private static boolean isEmail(String string) {
        if (string == null)
            return false;
        String regEx1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern p;
        Matcher m;
        p = Pattern.compile(regEx1);
        m = p.matcher(string);
        if (m.matches())
            return true;
        else
            return false;
    }


    private String getBindKey(String key) {
        return CampusConstant.BIND_MAIL_KEY + key;
    }


    private String getCheckKey(String key) {
        return CampusConstant.MAIL_CHECK_KEY + key;
    }
}
