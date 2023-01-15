package com.oddfar.campus.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.oddfar.campus.business.domain.entity.CampusFileEntity;
import com.oddfar.campus.business.domain.vo.CampusFileVo;
import com.oddfar.campus.business.mapper.CampusFileMapper;
import com.oddfar.campus.business.service.CampusFileService;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author ningzhiyuan
 */
@Service
public class CampusFileServiceImpl extends ServiceImpl<CampusFileMapper, CampusFileEntity>
        implements CampusFileService {

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
}




