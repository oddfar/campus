package com.oddfar.campus.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.common.domain.PageResult;

/**
 * @author ningzhiyuan
 */
public interface ContentService extends IService<ContentEntity> {

    PageResult<ContentVo> page(ContentEntity contentEntity);

    /**
     * 最新墙
     * @param contentEntity
     * @return
     */
    PageResult<ContentVo> newestPage(ContentEntity contentEntity);

    /**
     * 查询根据id校园墙内容
     *
     * @return 校园墙内容
     */
    ContentVo selectContentByContentId(ContentEntity contentEntity);

    /**
     * 更新校园墙内容
     *
     * @param content 校园墙内容
     * @return
     */
    int updateContent(ContentEntity content);

}
