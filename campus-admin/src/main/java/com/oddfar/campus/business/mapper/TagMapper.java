package com.oddfar.campus.business.mapper;

import com.oddfar.campus.business.domain.entity.ContentTagEntity;
import com.oddfar.campus.business.domain.entity.TagEntity;
import com.oddfar.campus.common.core.BaseMapperX;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import com.oddfar.campus.common.domain.PageResult;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    /**
     * 查询信息墙列表的标签列表
     * @param contentIds
     */
    List<ContentTagEntity> selectTagListByContentIds(@Param("contentIds") List<Long> contentIds);
}




