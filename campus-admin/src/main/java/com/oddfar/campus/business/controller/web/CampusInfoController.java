package com.oddfar.campus.business.controller.web;

import cn.hutool.core.bean.BeanUtil;
import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.business.domain.entity.CommentEntity;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.CommentVo;
import com.oddfar.campus.business.domain.vo.ContentQueryVo;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.business.service.*;
import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import com.oddfar.campus.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 校园墙的一些信息
 *
 * @author 致远
 */
@RestController
@RequestMapping("/campus")
@ApiResource(name = "校园墙信息", appCode = "campus", resBizType = ResBizTypeEnum.BUSINESS)
public class CampusInfoController {

    @Autowired
    private TagService tagService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ContentService contentService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ContentLoveService loveService;
    @Autowired
    private CampusFileService fileService;

    /**
     * 查询分类列表
     */
    @Anonymous
    @GetMapping(value = "/categoryList", name = "查询分类列表")
    public R categoryList() {
        CategoryEntity categoryEntity = new CategoryEntity();
        List<CategoryEntity> page = categoryService.listCategory(categoryEntity);

        return R.ok().put(page);
    }

    /**
     * 查询分类子列表
     * @param categoryId 分类id
     * @return
     */
    @Anonymous
    @GetMapping(value = "/categoryChildren/{categoryId}", name = "查询分类子列表")
    public R categoryChildren(@PathVariable Long categoryId) {
        CategoryEntity categoryEntity = categoryService.selectCategoryById(categoryId);
        return R.ok(categoryEntity);
    }

    /**
     * 查询信息墙内容列表
     * @param contentQueryVo 查询参数
     * @return
     */
    @Anonymous
    @PostMapping(value = "/contentList", name = "查询信息墙内容列表")
    public R getContentList(@RequestBody(required = false) ContentQueryVo contentQueryVo) {
        ContentEntity contentEntity = new ContentEntity();
        BeanUtil.copyProperties(contentQueryVo, contentEntity);

        contentEntity.setStatus(1);

        //最新墙 热门墙等等。。。
        Long categoryId = contentQueryVo.getCategoryId();
        PageResult<ContentVo> page = null;
        if (categoryId == null) {
            page = contentService.newestPage(contentEntity);
        } else {
            if (categoryId == 1) {
                //最新墙
                page = contentService.newestPage(contentEntity);
            } else {
                page = contentService.page(contentEntity);
            }
        }

        R r = new R();
        r.put(page);
        //获取点赞列表
        List<Long> loveContentIds = new ArrayList<>();
        if (SecurityUtils.isLogin()) {
            List<Long> ids = loveService.getLoveInfo(SecurityUtils.getUserId(), page.getRows());
            loveContentIds.addAll(ids);
        }
        r.put("loveContentIds", loveContentIds);
        return r;
    }


    /**
     * 根据contentId查询信息墙详细内容
     */
    @Anonymous
    @GetMapping(value = "/getContent", name = "查询信息墙详细内容")
    public R getContentById(Long id) {
        ContentEntity contentEntity = new ContentEntity();
        contentEntity.setContentId(id);
        contentEntity.setStatus(1);

        ContentVo contentVo = contentService.selectContentByContentId(contentEntity);
        R r = new R();
        if (contentVo != null) {
            r.put("data", contentVo);
            if (SecurityUtils.isLogin()) {
                r.put("isLove", loveService.isLove(SecurityUtils.getUserId(), contentVo.getContentId()));
            } else {
                r.put("isLove", false);
            }

        }

        return r;

    }

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
     * 查询一级评论
     */
    @Anonymous
    @GetMapping(value = "/getCommentChildren", name = "查询一级评论")
    public R getCommentChildren(CommentEntity commentEntity) {
        PageResult<CommentVo> commentVos = commentService.selectOneLevelChild(commentEntity);

        return R.ok().put(commentVos);

    }

    @Anonymous
    @GetMapping("test")
    public R test() {

        return R.ok();
    }

}
