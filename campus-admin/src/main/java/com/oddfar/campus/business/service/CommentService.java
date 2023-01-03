package com.oddfar.campus.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.oddfar.campus.business.domain.entity.CommentEntity;
import com.oddfar.campus.common.domain.PageResult;


public interface CommentService extends IService<CommentEntity> {

    /**
     * 查询分页
     *
     * @param comment
     * @return
     */
    PageResult<CommentEntity> page(CommentEntity comment);


    /**
     * 新增评论
     *
     * @param comment 评论
     * @return 结果
     */
    public int insertComment(CommentEntity comment);

    /**
     * 修改评论
     *
     * @param comment 评论
     * @return 结果
     */
    public int updateComment(CommentEntity comment);

}
