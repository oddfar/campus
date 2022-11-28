package com.oddfar.campus.common.core.convert;


import com.oddfar.campus.common.domain.entity.SysUserEntity;
import com.oddfar.campus.common.domain.vo.SysUserVO;
import org.apache.ibatis.annotations.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
* 123
*
* @author 致远 oddfar@163.com
* @since 1.0.0 2022-09-24
*/
@Mapper
public interface SysUserConvert {
    SysUserConvert INSTANCE = Mappers.getMapper(SysUserConvert.class);

    SysUserEntity convert(SysUserVO vo);

    SysUserVO convert(SysUserEntity entity);

    List<SysUserVO> convertList(List<SysUserEntity> list);

}