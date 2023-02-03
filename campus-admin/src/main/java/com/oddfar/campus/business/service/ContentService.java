package com.oddfar.campus.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.business.domain.vo.SendContentVo;
import com.oddfar.campus.common.domain.PageResult;

import java.util.List;

/**
 * @author ningzhiyuan
 */
public interface ContentService extends IService<ContentEntity> {

    PageResult<ContentVo> page(ContentEntity contentEntity);

    /**
     * 最新墙
     *
     * @return
     */
    PageResult<ContentVo> newestPage();

    /**
     * 热门墙
     *
     * @return
     */
    PageResult<ContentVo> hotPage();

    /**
     * 查询某用户的点赞墙列表
     *
     * @return
     */
    PageResult<ContentVo> getLoveContentByUserId(Long userId);

    /**
     * 查询自己的信息墙列表
     *
     * @return
     */
    PageResult<ContentVo> getOwnContent();

    /**
     * 查询根据id校园墙内容
     *
     * @return 校园墙内容
     */
    ContentVo selectContentByContentId(ContentEntity contentEntity);


    /**
     * 用户发表信息墙
     *
     * @param sendContentVo
     * @return
     */
    int sendContent(SendContentVo sendContentVo);

    /**
     * 更新校园墙内容
     *
     * @param content 校园墙内容
     * @return
     */
    int updateContent(ContentEntity content);


    /**
     * 查询热门信息墙内容列表（热度根据点赞高低判断）
     *
     * @return
     */
    List<ContentEntity> getSimpleHotContent();
}
