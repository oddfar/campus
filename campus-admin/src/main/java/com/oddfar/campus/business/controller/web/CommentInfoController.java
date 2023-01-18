package com.oddfar.campus.business.controller.web;

import cn.hutool.core.bean.BeanUtil;
import com.oddfar.campus.business.domain.entity.CommentEntity;
import com.oddfar.campus.business.domain.vo.CommentVo;
import com.oddfar.campus.business.domain.vo.ToCommentVo;
import com.oddfar.campus.business.service.CommentService;
import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/campus")
@ApiResource(name = "评论api", appCode = "campus", resBizType = ResBizTypeEnum.BUSINESS)
public class CommentInfoController {
    @Autowired
    private CommentService commentService;


    /**
     * 查询一级评论
     */
    @Anonymous
    @GetMapping(value = "/getOneLevelComment", name = "查询一级评论")
    public R getOneLevelComment(CommentEntity commentEntity) {
        PageResult<CommentVo> commentVos = commentService.selectOneLevel(commentEntity);
        return R.ok().put(commentVos);
    }

    /**
     * 查询一级评论的子评论
     */
    @Anonymous
    @GetMapping(value = "/getCommentChildren", name = "查询一级评论的子评论")
    public R getCommentChildren(CommentEntity commentEntity) {
        PageResult<CommentVo> commentVos = commentService.selectOneLevelChild(commentEntity);
        return R.ok().put(commentVos);
    }

    /**
     * 添加评论
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/toComment", name = "添加评论")
    public R toComment(ToCommentVo toCommentVo) {
        CommentEntity commentEntity = new CommentEntity();
        BeanUtil.copyProperties(toCommentVo, commentEntity);

        commentService.insertComment(commentEntity);
        return R.ok();
    }


}
