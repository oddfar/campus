package com.oddfar.campus.business.service.impl;

import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.oddfar.campus.business.core.expander.CampusConfigExpander;
import com.oddfar.campus.business.domain.entity.CampusFileEntity;
import com.oddfar.campus.business.domain.vo.CampusFileVo;
import com.oddfar.campus.business.enums.CampusBizCodeEnum;
import com.oddfar.campus.business.mapper.CampusFileMapper;
import com.oddfar.campus.business.service.CampusFileService;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import com.oddfar.campus.common.exception.ServiceException;
import com.oddfar.campus.common.exception.file.FileSizeLimitExceededException;
import com.oddfar.campus.common.utils.SecurityUtils;
import com.oddfar.campus.framework.api.file.FileUploadUtils;
import com.oddfar.campus.framework.api.file.MimeTypeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author ningzhiyuan
 */
@Service
public class CampusFileServiceImpl extends ServiceImpl<CampusFileMapper, CampusFileEntity>
        implements CampusFileService {

    /**
     * 文件起始路径
     */
    private static String CAMPUS_FILE_PATH = CampusConfigExpander.getCampusFilePath();

    /**
     * 文件当日最大上传数量
     */
    private static final int FILE_MAX_COUNT_DAY = 50;

    /**
     * 图片最大为5M
     */
    private static final int IMAGE_MAX_SIZE = 5 * 1024 * 1024;

    /**
     * 视频最大为20M
     */
    private static final int VIDEO_MAX_SIZE = 20 * 1024 * 1024;

    @Autowired
    private CampusFileMapper campusFileMapper;

    @Override
    public List<CampusFileVo> getContentFile(List<Long> contentId) {
        List<CampusFileEntity> campusFileEntities = campusFileMapper.selectList(
                new LambdaQueryWrapperX<CampusFileEntity>().in(CampusFileEntity::getContentId, contentId));

        //根据id,把url相放入前面的集合
        List<CampusFileEntity> collect = campusFileEntities.stream().collect(
                Collectors.toMap(CampusFileEntity::getContentId, a -> a, (o1, o2) -> {
                    List<String> fileUrl = o1.getFileUrls();
                    if (fileUrl.size() == 0) {
                        fileUrl.add(o1.getUrl());
                    }
                    fileUrl.add(o2.getUrl());
                    return o1;
                })).values().stream().collect(Collectors.toList());
        //转集合
        List<CampusFileVo> CampusFileVoList = collect.stream().map(CampusFileVo::new).collect(Collectors.toList());


        return CampusFileVoList;
    }

    @Override
    public CampusFileVo getContentFile(Long contentId) {
        return campusFileMapper.getContentFile(contentId);
    }

    @Override
    public CampusFileEntity fileUploadImage(MultipartFile file) {
        assertAllowed();
        if (file.getSize() > IMAGE_MAX_SIZE) {
            throw new FileSizeLimitExceededException(IMAGE_MAX_SIZE / 1024 / 1024);
        }
        try {
            String path = FileUploadUtils.upload(CAMPUS_FILE_PATH, file, MimeTypeUtils.IMAGE_EXTENSION);
            return saveDB(path);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e.getMessage());
        }

    }

    @Override
    public CampusFileEntity fileUploadVideo(MultipartFile file) {
        assertAllowed();
        if (file.getSize() > VIDEO_MAX_SIZE) {
            throw new FileSizeLimitExceededException(VIDEO_MAX_SIZE / 1024 / 1024);
        }
        try {
            String path = FileUploadUtils.upload(CAMPUS_FILE_PATH, file, MimeTypeUtils.VIDEO_EXTENSION);
            return saveDB(path);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e.getMessage());
        }

    }

    @Override
    public int updateContentFile(List<Long> fileIds, Long contentId) {
        return campusFileMapper.updateContentFile(fileIds, contentId);
    }

    @Override
    public boolean fileExist(List<Long> fileIds,int type) {
        if (fileIds.size() == 0) {
            return false;
        }
        Long count = campusFileMapper.selectCount(new LambdaQueryWrapperX<CampusFileEntity>()
                .in(CampusFileEntity::getFileId, fileIds).isNull(CampusFileEntity::getContentId));
        return count == fileIds.size();
    }

    /**
     * 文件是否允许上传
     */
    private void assertAllowed() {

        long countDay = campusFileMapper.getFileCountDay(SecurityUtils.getUserId());

        if (countDay >= FILE_MAX_COUNT_DAY) {
            throw new ServiceException(CampusBizCodeEnum.TOO_MANY_File.getMsg(),
                    CampusBizCodeEnum.TOO_MANY_File.getCode());
        }
    }

    /**
     * 保存文件信息到数据库
     *
     * @return
     */
    private CampusFileEntity saveDB(String path) {
        CampusFileEntity campusFileEntity = new CampusFileEntity();
        campusFileEntity.setFileId(IdWorker.getId());
        campusFileEntity.setUserId(SecurityUtils.getUserId());
        campusFileEntity.setUrl(path);
        campusFileEntity.setCreateTime(new Date());
        campusFileMapper.insert(campusFileEntity);
        return campusFileEntity;
    }
}




