package com.oddfar.campus.business.mapper;

import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.common.core.BaseMapperX;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import com.oddfar.campus.common.domain.PageResult;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ContentMapper extends BaseMapperX<ContentEntity> {
    default PageResult<ContentEntity> selectPage(ContentEntity content) {

        return selectPage(content, new LambdaQueryWrapperX<ContentEntity>()
                .eqIfPresent(ContentEntity::getType, content.getType())
                .eqIfPresent(ContentEntity::getIsAnonymous, content.getIsAnonymous())
                .eqIfPresent(ContentEntity::getStatus, content.getStatus())
                .likeIfPresent(ContentEntity::getContent,content.getContent())
                .betweenIfPresent(ContentEntity::getCreateTime, content.getParams())
        );

    }

    List<ContentVo> selectContentList(ContentEntity contentEntity);



}




