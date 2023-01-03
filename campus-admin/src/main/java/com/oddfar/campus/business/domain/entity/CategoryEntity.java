package com.oddfar.campus.business.domain.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.oddfar.campus.common.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * 分类表
 */
@TableName(value = "campus_category")
@Data
@EqualsAndHashCode(callSuper = true)
public class CategoryEntity extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 分类主键
     */
    @TableId
    private Long categoryId;

    /**
     * 分类名
     */
    @NotBlank(message = "分类名不能为空")
    @Size(min = 0, max = 100, message = "分类名不能超过100个字符")
    private String categoryName;

    /**
     * 父分类id
     */
    private Long parentId;

    /**
     * 显示顺序
     */
    private int orderNum;

    /**
     * 系统内置（Y是 N否）
     */
    private String type;

    /**
     * 描述
     */
    private String description;

    /**
     * 缩略名
     */
    @NotBlank(message = "缩略名不能为空")
    @Size(min = 0, max = 100, message = "缩略名不能超过100个字符")
    private String slug;

    /**
     * 状态（0正常 1停用）
     */
    private String status;

    /**
     * 菜单图标
     */
    private String icon;

    /**
     * 是否包含子节点
     */
    @TableField(exist = false)
    private boolean hasChildren;

    /**
     * 子节点
     */
    @TableField(exist = false)
    private List<CategoryEntity> children;


}