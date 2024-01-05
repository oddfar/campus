package com.oddfar.campus.common.domain.event;

import lombok.Data;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;

/**
 * 登录事件
 *
 * @author oddfar
 */
@Data
public class LogininforEvent implements Serializable {

    private static final long serialVersionUID = 1L;


    /**
     * 用户账号
     */
    private String username;

    /**
     * 用户账号
     */
    private Long userId;

    /**
     * 状态
     */
    private String status;

    /**
     * 消息
     */
    private String message;

    /**
     * 请求体
     */
    private HttpServletRequest request;

    /**
     * 其他参数
     */
    private Object[] args;

}
