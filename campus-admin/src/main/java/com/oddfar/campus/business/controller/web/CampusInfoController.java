package com.oddfar.campus.business.controller.web;

import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.business.service.*;
import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 校园墙的一些信息
 *
 * @author 致远
 */
@RestController
@RequestMapping("/campus")
@ApiResource(name = "校园墙信息api", appCode = "campus", resBizType = ResBizTypeEnum.BUSINESS)
public class CampusInfoController {

    @Autowired
    private CategoryService categoryService;

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


}
