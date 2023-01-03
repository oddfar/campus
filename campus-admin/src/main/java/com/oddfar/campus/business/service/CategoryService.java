package com.oddfar.campus.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.common.domain.PageResult;

import java.util.List;

/**
 * @author zhiyuan
 */
public interface CategoryService extends IService<CategoryEntity> {
    /**
     * 查询分页
     *
     * @param category
     * @return
     */
    PageResult<CategoryEntity> page(CategoryEntity category);

    /**
     * 分类列表
     * @param category
     * @return
     */
    List<CategoryEntity> listCategory(CategoryEntity category);

    /**
     * 分类列表
     * @return
     */
    List<CategoryEntity> categorySelect();

    /**
     * 新增分类
     *
     * @param category 分类
     * @return 结果
     */
    int insertCategory(CategoryEntity category);

    /**
     * 修改分类
     *
     * @param category 分类
     * @return 结果
     */
    int updateCategory(CategoryEntity category);

    /**
     * 删除分类
     * @param categoryId
     */
    void deleteCategoryById(Long categoryId);

    /**
     * 根据分类id查询分类及子分类
     * @param categoryId
     * @return
     */
    CategoryEntity selectCategoryById(Long categoryId);

    /**
     * 根据分类id查询子分类
     * @param categoryId
     * @return
     */
    List<CategoryEntity> selectCategoryChildren(Long categoryId);

    /**
     * 查询分类是否存在
     * @param categoryId 分类id
     * @return true为存在
     */
    boolean hasCategoryById(Long categoryId);
    /**
     * 校验分类名称是否唯一
     *
     * @param category 分类
     * @return 结果
     */
    boolean checkNameUnique(CategoryEntity category);

    /**
     * 校验分类缩写是否唯一
     *
     * @param category 分类
     * @return 结果
     */
    boolean checkSlugUnique(CategoryEntity category);

    /**
     * 是否存在分类子节点
     *
     * @param categoryId 分类ID
     * @return 结果 true 存在 false 不存在
     */
    boolean hasChildByCategoryId(Long categoryId);


}
