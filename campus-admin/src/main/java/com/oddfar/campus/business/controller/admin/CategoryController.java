package com.oddfar.campus.business.controller.admin;

import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.business.service.CategoryService;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 分类Controller
 *
 * @author 致远
 */
@RestController
@RequestMapping("/admin/category")
@ApiResource(name = "分类管理", appCode = "campus", resBizType = ResBizTypeEnum.BUSINESS)
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 查询分类列表
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/list", name = "查询分类列表")
    public R list(CategoryEntity category) {

        List<CategoryEntity> page = categoryService.listCategory(category);
        return R.ok().put(page);
    }

    /**
     * 查询分类列表选择器
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/listSelect",name = "查询分类列表选择器")
    public R listSelect() {
        List<CategoryEntity> page = categoryService.categorySelect();
        return R.ok().put(page);
    }

    /**
     * 获取分类详细信息
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/{categoryId}",name = "获取分类详细信息")
    public R getInfo(@PathVariable("categoryId") Long categoryId) {
        return R.ok(categoryService.getById(categoryId));
    }

    /**
     * 新增分类
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PostMapping(name = "新增分类")
    public R add(@Validated @RequestBody CategoryEntity category) {

        return R.ok(categoryService.insertCategory(category));
    }

    /**
     * 修改分类
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PutMapping(name = "修改分类")
    public R edit(@Validated @RequestBody CategoryEntity category) {

        return R.ok(categoryService.updateCategory(category));
    }

    /**
     * 删除分类
     */
    @PreAuthorize("@ss.resourceAuth()")
    @DeleteMapping(value = "/{categoryId}",name = "删除分类")
    public R remove(@PathVariable("categoryId") Long categoryId) {
        categoryService.deleteCategoryById(categoryId);
        return R.ok();
    }
}
