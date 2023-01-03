package com.oddfar.campus.business.controller.web;

import cn.hutool.core.bean.BeanUtil;
import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.ContentQueryVo;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.business.service.CategoryService;
import com.oddfar.campus.business.service.ContentLoveService;
import com.oddfar.campus.business.service.ContentService;
import com.oddfar.campus.business.service.TagService;
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
    private ContentLoveService contentLoveService;

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
     */
    @Anonymous
    @GetMapping(value = "/categoryChildren/{categoryId}", name = "查询分类列表")
    public R categoryChildren(@PathVariable Long categoryId) {
        CategoryEntity categoryEntity = categoryService.selectCategoryById(categoryId);
        return R.ok(categoryEntity);
    }

    /**
     * 查询信息墙内容列表
     */
    @Anonymous
    @PostMapping(value = "/contentList", name = "查询信息墙内容列表")
    public R getContentList(@RequestBody(required = false) ContentQueryVo contentQueryVo) {
        ContentEntity contentEntity = new ContentEntity();
        BeanUtil.copyProperties(contentQueryVo, contentEntity);

        contentEntity.setPageNum(contentQueryVo.getPageNum());
        contentEntity.setPageSize(10);
        contentEntity.setStatus(1);

        //最新墙 热门墙等等。。。
        Long categoryId = contentQueryVo.getCategoryId();
        PageResult<ContentVo> page = null;
        if (categoryId == null) {
            page = contentService.newestPage(contentEntity);
        } else {
            if (categoryId == 1) {
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
            List<Long> ids = contentLoveService.getLoveInfo(SecurityUtils.getUserId(), page.getRows());
            loveContentIds.addAll(ids);

        }
        r.put("loveContentIds", loveContentIds);
        return r;
    }


    /**
     * 查询信息墙详细内容
     */
    @Anonymous
    @GetMapping(value = "/getContent", name = "查询信息墙内容")
    public R getContentById(Long id) {
        ContentEntity contentEntity = new ContentEntity();
        contentEntity.setContentId(id);
        contentEntity.setStatus(1);

        ContentVo contentVo = contentService.selectContentByContentId(contentEntity);
        R r = new R();
        if (contentVo != null) {
            r.put("data", contentVo);
            r.put("isLove", contentLoveService.isLove(SecurityUtils.getUserId(), contentVo.getContentId()));
        }


        return r;

    }


}
