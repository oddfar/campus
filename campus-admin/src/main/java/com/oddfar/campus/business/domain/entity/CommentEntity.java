package com.oddfar.campus.business.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.oddfar.campus.common.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * campus_comment评论表
 *
 * @author zhiyuan
 */
@Data
@TableName("campus_comment")
@EqualsAndHashCode(callSuper = true)
public class CommentEntity extends BaseEntity {
    private static final long serialVersionUID = 1L;

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
     * 所回复目标评论的用户id
     */
    private Long toUserId;

    /**
     * 所属的一级评论id
     */
    private Long oneLevelId;

    /**
     * 内容id
     */
    private Long contentId;

    /**
     * 评论内容
     */
    private String coContent;

    /**
     * 评论时的ip
     */
    private String ip;

    /**
     * 评论时的地址
     */
    private String address;

}
