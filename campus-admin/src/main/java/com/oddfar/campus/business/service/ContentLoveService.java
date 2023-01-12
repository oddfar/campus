package com.oddfar.campus.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.oddfar.campus.business.domain.entity.ContentLoveEntity;
import com.oddfar.campus.business.domain.vo.ContentVo;

import java.util.List;

/**
 * @author 致远
 */
public interface ContentLoveService extends IService<ContentLoveEntity> {

    /**
     * 信息墙点赞/取消点赞
     *
     * @param userId
     * @param contentId
     * @return
     */
    int zanContent(Long userId, Long contentId);

    /**
     * 用户是否点赞
     *
     * @param userId
     * @param contentId
     * @return 真为点赞
     */
    boolean isLove(Long userId, Long contentId);

    /**
     * 获取点赞信息列表
     *
     * @return
     */
    List<Long> getLoveInfo(Long userId, List<ContentVo> contentVos);
}
