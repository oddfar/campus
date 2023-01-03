package com.oddfar.campus.business.controller.admin;

import com.oddfar.campus.business.domain.entity.TagEntity;
import com.oddfar.campus.business.service.TagService;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

/**
 * 标签Controller
 *
 * @author 致远
 */
@RestController
@RequestMapping("/admin/tag")
@ApiResource(name = "标签管理" , appCode = "campus" , resBizType = ResBizTypeEnum.BUSINESS)
public class TagController {
    @Autowired
    private TagService tagService;

    /**
     * 查询标签列表
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping("/list")
    public R list(TagEntity tag) {
        PageResult<TagEntity> page = tagService.page(tag);

        return R.ok().put(page);
    }


    /**
     * 获取标签详细信息
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/{tagId}")
    public R getInfo(@PathVariable("tagId") Long tagId) {
        return R.ok(tagService.getById(tagId));
    }

    /**
     * 新增标签
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PostMapping
    public R add(@Validated @RequestBody TagEntity tag) {
        return R.ok(tagService.insertTag(tag));
    }

    /**
     * 修改标签
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PutMapping
    public R edit(@Validated @RequestBody TagEntity tag) {
        return R.ok(tagService.updateTag(tag));
    }

    /**
     * 删除标签
     */
    @PreAuthorize("@ss.resourceAuth()")
    @DeleteMapping("/{tagIds}")
    public R remove(@PathVariable Long[] tagIds) {
        return R.ok(tagService.removeBatchByIds((Arrays.asList(tagIds))));
    }
}
