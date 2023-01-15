package com.oddfar.campus.business.controller.admin;

import com.oddfar.campus.business.domain.entity.CommentEntity;
import com.oddfar.campus.business.service.CommentService;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

@RestController
@RequestMapping("/admin/comment")
@ApiResource(name = "评论管理", appCode = "campus", resBizType = ResBizTypeEnum.BUSINESS)
public class CommentController {

    @Autowired
    private CommentService commentService;

    /**
     * 查询评论列表
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/list")
    public R list(CommentEntity comment) {
        PageResult<CommentEntity> page = commentService.page(comment);

        return R.ok().put(page);
    }


    /**
     * 获取评论详细信息
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/{commentId}")
    public R getInfo(@PathVariable("commentId") Long commentId) {
        return R.ok(commentService.getById(commentId));
    }

    /**
     * 新增评论
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PostMapping
    public R add(@Validated @RequestBody CommentEntity comment) {
        return R.ok(commentService.insertComment(comment));
    }

    /**
     * 修改评论
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PutMapping
    public R edit(@Validated @RequestBody CommentEntity comment) {
        return R.ok(commentService.updateComment(comment));
    }

    /**
     * 删除评论
     */
    @PreAuthorize("@ss.resourceAuth()")
    @DeleteMapping("/{commentIds}")
    public R remove(@PathVariable Long[] commentIds) {
        return R.ok(commentService.removeBatchByIds(Arrays.asList(commentIds)));
    }

}
