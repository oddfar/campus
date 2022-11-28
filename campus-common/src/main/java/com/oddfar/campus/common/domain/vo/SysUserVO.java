package com.oddfar.campus.common.domain.vo;

import com.oddfar.campus.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
* 123
*
* @author 致远 oddfar@163.com
* @since 1.0.0 2022-09-24
*/
@Data
@Schema(description = "123")
@EqualsAndHashCode(callSuper = true)
public class SysUserVO extends PageParam  {
	private static final long serialVersionUID = 1L;

	@Schema(description = "用户ID")
	private Long uid;

	@Schema(description = "用户账号")
	private String userAccount;

	@Schema(description = "用户昵称")
	private String userName;

	@Schema(description = "用户邮箱")
	private String userEmail;

	@Schema(description = "用户类型（0为用户,1管理员，2系统管理员）")
	private Integer userType;

	@Schema(description = "用户头像的fileID")
	private Long avatar;

	@Schema(description = "密码")
	private String password;

	@Schema(description = "状态（0：锁定 1：正常）")
	private Integer status;



}