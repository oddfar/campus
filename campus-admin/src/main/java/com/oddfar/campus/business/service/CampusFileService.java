package com.oddfar.campus.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.oddfar.campus.business.domain.entity.CampusFileEntity;
import com.oddfar.campus.business.domain.vo.CampusFileVo;
import org.springframework.web.multipart.MultipartFile;

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

    /**
     * 上传图片
     * @param file
     */
    CampusFileEntity fileUploadImage(MultipartFile file);

    /**
     * 上传视频
     * @param file
     */
    CampusFileEntity fileUploadVideo(MultipartFile file);

    /**
     * 修改文件的contentId
     * @param fileIds
     * @param contentId
     * @return
     */
    int updateContentFile(List<Long> fileIds,Long contentId);

    /**
     * 文件是否都存在 且 contentId为null
     * @param fileId
     * @return
     */
    boolean fileExist(List<Long> fileId,int type);


}
