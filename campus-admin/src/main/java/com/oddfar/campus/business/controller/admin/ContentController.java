package com.oddfar.campus.business.controller.admin;

import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.business.service.ContentService;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 校园墙内容管理
 *
 * @author 致远
 */
@RestController
@RequestMapping("/admin/content")
@ApiResource(name = "内容管理", appCode = "campus", resBizType = ResBizTypeEnum.BUSINESS)
public class ContentController {
    @Autowired
    private ContentService contentService;

    @GetMapping(value = "list", name = "分页")
    @PreAuthorize("@ss.resourceAuth()")
    public R page(ContentEntity contentEntity) {
        PageResult<ContentVo> page = contentService.page(contentEntity);

        return R.ok().put(page);
    }


    /**
     * 获取校园墙内容详细信息
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/{contentId}")
    public R getInfo(@PathVariable("contentId") Long contentId) {
        ContentEntity contentEntity = new ContentEntity();
        contentEntity.setContentId(contentId);
        return R.ok(contentService.selectContentByContentId(contentEntity));
    }


    /**
     * 修改校园墙内容
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PutMapping
    public R edit(@Validated @RequestBody ContentEntity content) {
        return R.ok(contentService.updateContent(content));
    }

    /**
     * 删除校园墙内容
     */
//    @PreAuthorize("@ss.resourceAuth()")
//    @DeleteMapping("/{contentIds}")
//    public AjaxResult remove(@PathVariable Long[] contentIds)
//    {
//        return toAjax(contentService.deleteContentByContentIds(contentIds));
//    }


}
