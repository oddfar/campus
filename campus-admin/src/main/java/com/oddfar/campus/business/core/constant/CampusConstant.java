package com.oddfar.campus.business.core.constant;

/**
 * 通用常量信息
 *
 */
public class CampusConstant {


    /**
     * 绑定邮箱有效期（分钟）
     */
    public static final Integer BIND_MAIL_EXPIRATION = 10;


    /**
     * 重发验证码有效期（分钟）
     */
    public static final Integer REGISTER_REPEAT_EXPIRATION = 1;

    /**
     * 注册邮箱的key
     */
    public static final String BIND_MAIL_KEY = "bind_mails:";

    /**
     * 检测重复发送邮箱验证码的key
     */
    public static final String MAIL_CHECK_KEY = "mail_check_codes:";

}
