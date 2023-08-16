package com.oddfar.campus.common.domain.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 角色与接口资源关系表
 */
@Data
@TableName("sys_role_resource")
public class SysRoleResourceEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 资源编码
     */
    @TableField
    private String resourceCode;

    /**
     * 角色ID
     */
    @TableField
    private Long roleId;
}
