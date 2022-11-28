package com.oddfar.campus.common.enums;

/***
 * 错误码和错误信息定义类
 * 1. 错误码定义规则为5为数字
 * 2. 前两位表示业务场景，最后三位表示错误码。例如：100001。10:通用 001:系统未知异常
 * 3. 维护错误码后需要维护错误描述，将他们定义为枚举形式
 * 错误码列表：
 *  10: 通用
 *      001：参数格式校验
 *      002：短信验证码频率太高
 *  11: 商品
 *  12: 订单
 *  13: 购物车
 *  14: 物流
 *  15: 用户
 *  21：库存
 *
 *
 */
public enum BizCodeEnum {
    UNKNOWN_EXCEPTION(10000, "系统未知错误"),
    VALID_EXCEPTION(10001, "参数校验异常"),
    SMS_CODE_EXCEPTION(10002, "验证码获取频率太高，请稍后再试"),
    TOO_MANY_REQUEST(10003, "请求流量过大，请稍后再试"),
    PRODUCT_UP_EXCEPTION(11000, "商品上架异常"),
    SMS_SEND_CODE_EXCEPTION(10403, "短信发送失败"),
    PHONE_EXIST_EXCEPTION(15002, "手机号已经存在"),
    USER_EXIST_EXCEPTION(15001, "用户已经存在"),
    LOGINACTT_PASSWORD_ERROR(15003, "账号或密码错误"),
    PHONE_EXISTS_EXCEPTION(15002, "手机号已存在"),
    NO_STOCK_EXCEPTION(21000, "商品库存不足"),
    LOGIN_ACCOUNT_PASSWORD_INVALID(15003, "用户名或密码错误");


    private Integer code;
    private String msg;

    private BizCodeEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
