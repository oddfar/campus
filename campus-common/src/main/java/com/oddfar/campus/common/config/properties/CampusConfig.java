package com.oddfar.campus.common.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 首页
 *
 * @author oddfar
 */

@Data
@Component
@ConfigurationProperties(prefix = "campus")
public class CampusConfig {

    /**
     * 项目名称
     */
    private String name;

    /**
     * 版本
     */
    private String version;

    /**
     * 获取地址开关
     */
    private static boolean addressEnabled;

    /**
     * 是否在线查询ip
     */
    private static boolean ipOnlineEnable;

    public static boolean isAddressEnabled() {
        return addressEnabled;
    }

    public void setAddressEnabled(boolean addressEnabled) {
        CampusConfig.addressEnabled = addressEnabled;
    }

    public static boolean isIpOnlineEnabled() {
        return ipOnlineEnable;
    }

    public static void setIpOnlineEnable(boolean ipOnlineEnable) {
        CampusConfig.ipOnlineEnable = ipOnlineEnable;
    }
}
