package com.oddfar.campus.business.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.oddfar.campus.common.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

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
    private Long metaId;

    /**
     * 分类名
     */
    private String metaName;

    /**
     * 父分类id
     */
    private Long parentId;

    /**
     * 描述
     */
    private String description;

    /**
     * 缩略名
     */
    private String slug;


}