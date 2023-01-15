package com.oddfar.campus.business.mapper;

import com.oddfar.campus.business.domain.entity.TagEntity;
import com.oddfar.campus.common.core.BaseMapperX;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import com.oddfar.campus.common.domain.PageResult;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author zhiyuan
 */
@Mapper
public interface TagMapper extends BaseMapperX<TagEntity> {

    default PageResult<TagEntity> selectPage(TagEntity tag) {

        return selectPage(new LambdaQueryWrapperX<TagEntity>()
                .likeIfPresent(TagEntity::getTagName, tag.getTagName())
                .eqIfPresent(TagEntity::getStatus, tag.getStatus())
        );
    }

}




