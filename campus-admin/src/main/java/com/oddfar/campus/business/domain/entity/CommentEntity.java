package com.oddfar.campus.business.domain.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.oddfar.campus.common.domain.BaseEntity;
import lombok.Data;

import java.util.List;

/**
 * campus_comment评论表
 *
 * @author zhiyuan
 */
@Data
@TableName("campus_comment")
public class CommentEntity extends BaseEntity {

    /**
     * 评论主键
     */
    @TableId
    private Long commentId;

    /**
     * 上级id
     */
    private Long parentId;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 内容id
     */
    private Long contentId;

    /**
     * 评论内容
     */
    private String coContent;

    /**
     * 是否包含子节点
     */
    @TableField(exist = false)
    private boolean hasChildren;

    /**
     * 子节点
     */
    @TableField(exist = false)
    private List<CommentEntity> children;

}
