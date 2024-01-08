package com.oddfar.campus.business.controller;

import com.oddfar.campus.common.annotation.RateLimiter;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.LimitType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 测试限流样例
 *
 * @author oddfar
 * @since 2024/1/7
 */
@RestController
@RequestMapping("/test/rateLimiter")
public class RedisRateLimiterController {
    /**
     * 测试全局限流
     * 全局影响
     */
    @RateLimiter(count = 5, time = 60)
    @GetMapping("/test")
    public R test() {
        return R.ok("操作成功");
    }

    /**
     * 测试请求IP限流
     * 同一IP请求受影响
     */
    @RateLimiter(count = 5, time = 60, limitType = LimitType.IP)
    @GetMapping("/testip")
    public R testip(String value) {
        return R.ok("操作成功", value);
    }

    /**
     * 测试请求IP限流(key基于参数获取)
     * 同一IP请求受影响
     */
    @RateLimiter(count = 5, time = 60, limitType = LimitType.IP, key = "#value")
    @GetMapping("/testObj")
    public R testObj(String value) {
        return R.ok("操作成功", value);
    }
}
