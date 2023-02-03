package com.oddfar.campus.business.core.api;

import com.oddfar.campus.common.domain.model.RegisterBody;

public interface MailServiceApi {

    /**
     * 发送注册邮箱的url验证
     */
    void bindMail(RegisterBody registerBody);

    /**
     * 检验邮箱验证码间隔是否存在
     *
     * @param email
     * @return 结果 true 存在
     */
    boolean checkEmailCode(String email);

    /**
     * 验证url邮箱uuid
     *
     * @param uuid
     * @return
     */
    boolean emailValidate(String uuid);
}
