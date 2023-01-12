package com.oddfar.campus.business.domain.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.oddfar.campus.business.domain.entity.CampusFileEntity;
import lombok.Data;

import java.util.List;

/**
 *
 */
@Data
public class CampusFileVo {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 文章id
     */
    private Long contentId;

    private List<String> fileUrls;

    public CampusFileVo() {
    }

    public CampusFileVo(Long contentId, List<String> fileUrls) {
        this.contentId = contentId;
        this.fileUrls = fileUrls;
    }
    public CampusFileVo(CampusFileEntity campusFileEntity) {
        this.contentId = campusFileEntity.getContentId();
        this.fileUrls = campusFileEntity.getFileUrls();
    }

}