package com.oddfar.campus.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.oddfar.campus.business.domain.entity.CampusFileEntity;
import com.oddfar.campus.business.domain.vo.CampusFileVo;

import java.util.List;

/**
* @author ningzhiyuan
*/
public interface CampusFileService extends IService<CampusFileEntity> {

    /**
     * 获取文件列表
     * @return
     */
    List<CampusFileVo> getContentFile(List<Long> contentId);

    /**
     * 获取文件列表
     * @return
     */
    CampusFileVo getContentFile(Long contentId);
}
