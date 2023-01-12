package com.oddfar.campus.business.domain.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.oddfar.campus.common.domain.PageParam;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class CommentVo extends PageParam {
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
     * 评论时的地址
     */
    private String address;
    /**
     * 用户昵称
     */
    @TableField(exist = false)
    private String userNickName;

    /**
     * 所回复目标评论的用户昵称
     */
    @TableField(exist = false)
    private String toUserNickName;

    /**
     * 用户头像
     */
    @TableField(exist = false)
    private String avatar;

    /**
     * 是否包含子节点
     */
    @TableField(exist = false)
    private boolean hasChildren;

    /**
     * 子节点数量
     */
    @TableField(exist = false)
    private int childrenCount;

    /**
     * 子节点
     */
    @TableField(exist = false)
    private List<CommentVo> children;

    /**
     * 创建时间
     */
//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}
