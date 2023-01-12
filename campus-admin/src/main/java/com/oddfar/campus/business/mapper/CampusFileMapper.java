package com.oddfar.campus.business.mapper;

import com.oddfar.campus.business.domain.entity.CampusFileEntity;
import com.oddfar.campus.business.domain.vo.CampusFileVo;
import com.oddfar.campus.common.core.BaseMapperX;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author ningzhiyuan
 */
@Mapper
public interface CampusFileMapper extends BaseMapperX<CampusFileEntity> {

    CampusFileVo getContentFile(@Param("contentId") Long contentId);
}




