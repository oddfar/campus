package com.oddfar.campus.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.oddfar.campus.business.domain.entity.CommentEntity;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.CommentVo;
import com.oddfar.campus.business.enums.CampusBizCodeEnum;
import com.oddfar.campus.business.mapper.CommentMapper;
import com.oddfar.campus.business.mapper.ContentMapper;
import com.oddfar.campus.business.service.CommentService;
import com.oddfar.campus.common.core.page.PageUtils;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.exception.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


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
    public PageResult<CommentVo> selectOneLevel(CommentEntity comment) {
        //设置分页
//        int firstIndex = (comment.getPageNum() - 1) * comment.getPageSize();
//        comment.setPageNum(firstIndex);

        ContentEntity content = contentMapper.selectById(comment.getContentId());

        if (content != null) {
            //开始分页，固定大小5
            PageUtils.startPage(5);
            //获取一级评论
            List<CommentVo> oneLevel = commentMapper.getOneLevel(comment);
            //查询一级评论中的子评论有作者的
            if (oneLevel.size() > 0) {
                List<Long> commentIdList = oneLevel.stream().map(CommentVo::getCommentId).collect(Collectors.toList());
                List<CommentVo> oneLevelChild = commentMapper.getOneLevelChildHaveAuthor(commentIdList, content.getUserId());
                oneLevel.addAll(oneLevelChild);
            }
            //封装分页数据
            return PageUtils.getPageResult(oneLevel);
        } else {
            return null;
        }

    }

    @Override
    public PageResult<CommentVo> selectOneLevelChild(CommentEntity comment) {
        //开始分页，固定大小5
        PageUtils.startPage(5);
        List<CommentVo> oneLevelChild = commentMapper.getOneLevelChild(comment);
        //封装分页数据
        return PageUtils.getPageResult(oneLevelChild);
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




