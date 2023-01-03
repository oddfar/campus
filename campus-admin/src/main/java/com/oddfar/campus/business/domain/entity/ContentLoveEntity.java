package com.oddfar.campus.business.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 
 * @TableName campus_content_love
 */
@TableName(value ="campus_content_love")
@Data
public class ContentLoveEntity{
    private static final long serialVersionUID = 1L;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 文章id
     */
    private Long contentId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public ContentLoveEntity() {
    }

    public ContentLoveEntity(Long userId, Long contentId) {
        this.userId = userId;
        this.contentId = contentId;
    }
}