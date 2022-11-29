package com.oddfar.campus.admin.business;

import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import com.oddfar.campus.framework.service.SysRoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
@ApiResource(name = "测试控制类", appCode = "campus", resBizType = ResBizTypeEnum.BUSINESS)
public class TestController {
    private static final Logger log = LoggerFactory.getLogger(TestController.class);

    @Autowired
    private SysRoleService roleService;

    @GetMapping(value = "1", name = "测试1")
    @PreAuthorize("@ss.resourceAuth()")
    public R test1() {

        return R.ok();
    }

    @GetMapping(value = "2", name = "测试2")
    @PreAuthorize("@ss.resourceAuth()")
    public R test2() {

        return R.ok();
    }

    @RequestMapping(value = "3",name = "测试3")
    @Anonymous//匿名访问，不需要登录和认证
    public R test3(){

        return R.ok();
    }
}
