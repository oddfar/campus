package com.oddfar.campus.business.controller;


import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.annotation.Sensitive;
import com.oddfar.campus.common.enums.SensitiveStrategy;
import com.oddfar.campus.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import lombok.Data;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 测试数据脱敏控制器
 * 参考：RuoYi-Vue-Plus
 */
@RestController
@RequestMapping("/sensitive")
public class TestSensitiveController {

    /**
     * 测试数据脱敏
     */
    @GetMapping("/test")
    @Anonymous
    @Operation(description = "测试数据脱敏")
    public R test() {
        TestSensitive testSensitive = new TestSensitive();
        testSensitive.setIdCard("123456200001011234");
        testSensitive.setPhone("12344447777");
        testSensitive.setAddress("北京市朝阳区某某四合院1203室");
        testSensitive.setEmail("17640125371@163.com");
        testSensitive.setBankCard("6226456952351452853");
        return R.ok(testSensitive);
    }

    @Data
    static class TestSensitive {

        /**
         * 身份证
         */
        @Sensitive(strategy = SensitiveStrategy.ID_CARD)
        private String idCard;

        /**
         * 电话
         */
        @Sensitive(strategy = SensitiveStrategy.PHONE)
        private String phone;

        /**
         * 地址
         */
        @Sensitive(strategy = SensitiveStrategy.ADDRESS)
        private String address;

        /**
         * 邮箱
         */
        @Sensitive(strategy = SensitiveStrategy.EMAIL)
        private String email;

        /**
         * 银行卡
         */
        @Sensitive(strategy = SensitiveStrategy.BANK_CARD)
        private String bankCard;

    }

}
