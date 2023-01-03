package com.oddfar.campus.business.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.oddfar.campus.common.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;


@TableName(value = "campus_file")
@Data
@EqualsAndHashCode(callSuper = true)
public class FileEntity extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 文件id
     */
    @TableId
    private Long fileId;

    /**
     * 文章id
     */
    private Long contentId;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 储存url
     */
    private String url;


}