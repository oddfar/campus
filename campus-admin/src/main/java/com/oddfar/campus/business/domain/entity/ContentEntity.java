package com.oddfar.campus.business.domain.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.oddfar.campus.common.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * content内容表
 *
 * @author zhiyuan
 */
@Data
@TableName("campus_content")
@EqualsAndHashCode(callSuper = true)
public class ContentEntity extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 内容id
     */
    @TableId("content_id")
    private Long contentId;

    /**
     * 用户id
     */
    @ApiModelProperty(value = "用户id")
    @TableField("user_id")
    private Long userId;

    /**
     * 类别id
     */
    @TableField("category_id")
    private Long categoryId;

    /**
     * 内容
     */
    @TableField("content")
    private String content;

    /**
     * 状态：0审核,1正常,2下架
     */
    @TableField("status")
    private Integer status;

    /**
     * 类型：0文字,1图片,2视频
     */
    @TableField("type")
    private Integer type;


    /**
     * 文件id
     */
    @TableField("file_number")
    private Long fileNumber;

    /**
     * 0不匿名，1匿名
     */
    @TableField("is_anonymous")
    private Integer isAnonymous;

    /**
     * 文件URL列表
     */
    @TableField(exist = false)
    List<String> fileUrl;
}
