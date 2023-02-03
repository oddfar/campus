package com.oddfar.campus.business.controller.web;

import com.oddfar.campus.business.core.api.MailServiceApi;
import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.domain.model.LoginUser;
import com.oddfar.campus.common.domain.model.RegisterBody;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import com.oddfar.campus.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 用户账户操作api
 * 绑定邮箱等
 *
 * @author 致远
 */
@RestController
@RequestMapping("/campus")
@ApiResource(name = "用户账户操作api", appCode = "campus", resBizType = ResBizTypeEnum.BUSINESS)
public class UserAccountController {

    @Autowired
    private MailServiceApi mailServiceApi;

    /**
     * 绑定/更换邮件
     *
     * @return
     */
    @PostMapping("/bindMail")
    public R sendMail(@RequestBody RegisterBody registerBody) {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        String password = loginUser.getPassword();
        if (!SecurityUtils.matchesPassword(registerBody.getPassword(), password)) {
            return R.error("密码错误");
        } else {
            mailServiceApi.bindMail(registerBody);
            return R.ok("正在发送邮件，请注意查收");
        }

    }

    /**
     * 邮件发送后，点击链接，验证uuid，成功后添加角色
     */
    @Anonymous
    @GetMapping("/email-validate")
    public R emailValidate(String uuid) {

        return R.ok(mailServiceApi.emailValidate(uuid));

    }

}
