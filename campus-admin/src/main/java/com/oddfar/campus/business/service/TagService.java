package com.oddfar.campus.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.oddfar.campus.business.domain.entity.ContentTagEntity;
import com.oddfar.campus.business.domain.entity.TagEntity;
import com.oddfar.campus.common.domain.PageResult;

import java.util.List;

public interface TagService extends IService<TagEntity> {

    PageResult<TagEntity> page(TagEntity tag);

    /**
     * 新增标签
     *
     * @param tag 标签
     * @return 结果
     */
    int insertTag(TagEntity tag);

    /**
     * 更新标签
     *
     * @param tag 标签
     * @return 结果
     */
    int updateTag(TagEntity tag);

    /**
     * 查询信息墙列表的标签列表
     * @param contentIds
     * @return
     */
    List<ContentTagEntity> getTagListByContentIds(List<Long> contentIds);

    /**
     * 校验标签名称是否唯一
     *
     * @param tag 标签
     * @return 结果
     */
    boolean checkNameUnique(TagEntity tag);
}
