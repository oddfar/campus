package com.oddfar.campus.business.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 
 * @TableName campus_content_tag
 */
@TableName(value ="campus_content_tag")
@Data
public class ContentTagEntity   {
    private static final long serialVersionUID = 1L;

    /**
     * 内容id
     */
    private Long contentId;

    /**
     * 标签id
     */
    private Long tagId;

    /**
     * 标签名
     */
    private String tagName;


}