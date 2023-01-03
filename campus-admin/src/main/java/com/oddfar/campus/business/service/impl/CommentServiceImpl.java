package com.oddfar.campus.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.oddfar.campus.business.domain.entity.CommentEntity;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.enums.CampusBizCodeEnum;
import com.oddfar.campus.business.mapper.CommentMapper;
import com.oddfar.campus.business.mapper.ContentMapper;
import com.oddfar.campus.business.service.CommentService;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.exception.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, CommentEntity>
        implements CommentService {

    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private ContentMapper contentMapper;

    @Override
    public PageResult<CommentEntity> page(CommentEntity comment) {
        return commentMapper.selectPage(comment);
    }

    @Override
    public int insertComment(CommentEntity comment) {
        ContentEntity contentEntity = contentMapper.selectById(comment.getContentId());
        if (contentEntity == null) {
            throw new ServiceException(CampusBizCodeEnum.CONTENT_IS_NULL.getMsg(), CampusBizCodeEnum.CONTENT_IS_NULL.getCode());
        }

        return commentMapper.insert(comment);
    }

    @Override
    public int updateComment(CommentEntity comment) {
        return commentMapper.updateById(comment);
    }
}




