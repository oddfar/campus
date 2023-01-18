package com.oddfar.campus.business.domain.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @TableName campus_file
 */
@TableName(value = "campus_file")
@Data
public class CampusFileEntity {

    @TableField(exist = false)
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

    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * url列表
     */
    @TableField(exist = false)
    private List<String> fileUrls = new ArrayList<String>();

    public List<String> getFileUrls() {
        if (fileUrls.size() == 0) {
            fileUrls.add(url);
        }
        return fileUrls;
    }

    public CampusFileEntity() {
    }

    public CampusFileEntity(Long userId, String url) {
        this.userId = userId;
        this.url = url;
    }

    public CampusFileEntity(Long fileId,Long userId, String url) {
        this.fileId = fileId;
        this.userId = userId;
        this.url = url;
    }


}