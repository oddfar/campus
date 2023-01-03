package com.oddfar.campus.business.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.oddfar.campus.common.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 分类表
 */
@TableName(value = "campus_tag")
@Data
@EqualsAndHashCode(callSuper = true)
public class TagEntity extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 标签主键
     */
    @TableId
    private Long tagId;

    /**
     * 标签名
     */
    private String tagName;

    /**
     * 描述
     */
    private String description;

    /**
     * 状态（0正常 1停用）
     */
    private String status;

}