package com.oddfar.campus.business.mapper;

import com.oddfar.campus.business.domain.entity.CommentEntity;
import com.oddfar.campus.common.core.BaseMapperX;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import com.oddfar.campus.common.domain.PageResult;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author zhiyuan
 */
@Mapper
public interface CommentMapper extends BaseMapperX<CommentEntity> {

    default PageResult<CommentEntity> selectPage(CommentEntity comment){

        return selectPage(comment, new LambdaQueryWrapperX<CommentEntity>()
                .likeIfPresent(CommentEntity::getCoContent, comment.getCoContent())
                .eqIfPresent(CommentEntity::getUserId,comment.getUserId())
                .eqIfPresent(CommentEntity::getContentId, comment.getContentId())
        );
    }

}




