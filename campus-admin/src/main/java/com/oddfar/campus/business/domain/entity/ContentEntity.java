package com.oddfar.campus.business.domain.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.oddfar.campus.common.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
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
    private Long userId;

    /**
     * 类别id
     */
    @NotNull(message = "类别不能为空")
    private Long categoryId;

    /**
     * 内容
     */
    @NotBlank(message = "内容不能为空")
    @Size(min = 0, max = 1000, message = "内容长度不能超过1000个字符")
    private String content;

    /**
     * 状态：0审核,1正常,2下架,3拒绝（审核不通过）
     */
    private Integer status;

    /**
     * 类型：0文字,1图片,2视频
     */
    private Integer type;

    /**
     * 文件数量
     */
    private Integer fileCount;

    /**
     * 点赞数量
     */
    private Long loveCount;
    /**
     * 0不匿名，1匿名
     */
    private Integer isAnonymous;

    /**
     * 备注
     */
    private String remark;

    /**
     * 文件URL列表
     */
    @TableField(exist = false)
    List<String> fileUrl;
}
