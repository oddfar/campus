package com.oddfar.campus.business.mapper;

import com.oddfar.campus.business.domain.entity.ContentLoveEntity;
import com.oddfar.campus.common.core.BaseMapperX;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.stream.Collectors;


@Mapper
public interface ContentLoveMapper extends BaseMapperX<ContentLoveEntity> {

    /**
     * 用户是否给某墙点赞
     *
     * @param userId
     * @param contentId
     * @return
     */
    default boolean isZan(Long userId, Long contentId) {
        Long num = selectCount(new LambdaQueryWrapperX<ContentLoveEntity>()
                .eq(ContentLoveEntity::getUserId, userId)
                .eq(ContentLoveEntity::getContentId, contentId));

        return num > 0;
    }

    /**
     * 取消点赞
     *
     * @param userId
     * @param contentId
     * @return
     */
    default int cancelLove(Long userId, Long contentId) {
        return delete(new LambdaQueryWrapperX<ContentLoveEntity>()
                .eq(ContentLoveEntity::getUserId, userId)
                .eq(ContentLoveEntity::getContentId, contentId));
    }

    /**
     * 筛选出墙列表中用户点赞的
     *
     * @param userId
     * @param contentIds
     * @return
     */
    default List<Long> getLoveList(Long userId, List<Long> contentIds) {

        List<ContentLoveEntity> loves = selectList(new LambdaQueryWrapperX<ContentLoveEntity>()
                .in(ContentLoveEntity::getContentId, contentIds)
                .eq(ContentLoveEntity::getUserId, userId));

        List<Long> ids = loves.stream().map(ContentLoveEntity::getContentId).collect(Collectors.toList());
        return ids;
    }
}




