package com.oddfar.campus.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.business.enums.CampusBizCodeEnum;
import com.oddfar.campus.business.mapper.CategoryMapper;
import com.oddfar.campus.business.service.CategoryService;
import com.oddfar.campus.common.constant.UserConstants;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.exception.ServiceException;
import com.oddfar.campus.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhiyuan
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, CategoryEntity>
        implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public PageResult<CategoryEntity> page(CategoryEntity categoryEntity) {
        return categoryMapper.selectPage(categoryEntity);
    }

    @Override
    public List<CategoryEntity> listCategory(CategoryEntity category) {
        return categoryMapper.selectList(new LambdaQueryWrapperX<CategoryEntity>()
                .likeIfPresent(CategoryEntity::getCategoryName, category.getCategoryName())
                .eqIfPresent(CategoryEntity::getStatus, category.getStatus())
                .eq(CategoryEntity::getStatus, 0)
                .orderByAsc(CategoryEntity::getOrderNum)
        );
    }

    @Override
    public List<CategoryEntity> categorySelect() {
        /**
         * 以下代码是获取一级列表，一级菜单后面跟着二级菜单
         * 例如：表白主，表白子，寻物主，寻物子
         * 此业务已不需要
         */
//        List<CategoryEntity> categoryList = categoryMapper.selectPrimary();
//
//        List<CategoryEntity> resList = new ArrayList<>(categoryList);
//        int addNum = 1;
//
//        for (int i = 0; i < categoryList.size(); i++) {
//            CategoryEntity category = categoryList.get(i);
//            List<CategoryEntity> children = selectCategoryChildren(category.getCategoryId());
//            if (children != null) {
//                resList.addAll(i + addNum, children);
//                addNum += children.size();
//            }
//        }

        return categoryMapper.selectList(new LambdaQueryWrapperX<CategoryEntity>()
                .eq(CategoryEntity::getStatus, 0)
                .eq(CategoryEntity::getType, "N")
                .orderByAsc(CategoryEntity::getOrderNum)
        );
    }

    @Override
    public int insertCategory(CategoryEntity category) {
        Long parentId = category.getParentId();
        //禁止添加三级分类
        if (parentId != null && parentId != 0) {
            CategoryEntity parentCategory = categoryMapper.selectById(parentId);
            if (parentCategory != null && parentCategory.getParentId() != 0) {
                throw new ServiceException(CampusBizCodeEnum.NO_THREE_CATEGORY.getMsg(), CampusBizCodeEnum.NO_THREE_CATEGORY.getCode());
            }
        }
        checkAddOrUpdate(category);
        if (category.getParentId() == null) {
            category.setParentId(0L);
        }
        return categoryMapper.insert(category);

    }

    @Override
    public int updateCategory(CategoryEntity category) {
        checkAddOrUpdate(category);
        return categoryMapper.updateById(category);
    }

    @Override
    public void deleteCategoryById(Long categoryId) {

        CategoryEntity categoryEntity = selectCategoryById(categoryId);

        if (categoryEntity == null) {
            return;
        }

        if (categoryEntity.isHasChildren()) {
            throw new ServiceException(String.format("参数【%1$s】存在子分类,不允许删除 ", categoryEntity.getCategoryName()));
        }
        if (StringUtils.equals(UserConstants.YES, categoryEntity.getType())) {
            throw new ServiceException(String.format("内置参数【%1$s】不能删除 ", categoryEntity.getCategoryName()));
        }
        categoryMapper.deleteById(categoryId);
    }

    @Override
    public CategoryEntity selectCategoryById(Long categoryId) {
        if (categoryId == null) {
            return null;
        }
        CategoryEntity categoryEntity = categoryMapper.selectById(categoryId);
        if (categoryEntity != null) {
            List<CategoryEntity> children = selectCategoryChildren(categoryId);
            if (children != null && children.size() > 0) {
                categoryEntity.setChildren(children);
                categoryEntity.setHasChildren(true);
            }
        }


        return categoryEntity;
    }

    @Override
    public List<CategoryEntity> selectCategoryChildren(Long categoryId) {
        QueryWrapper<CategoryEntity> wrapper = new QueryWrapper<CategoryEntity>().eq("parent_id", categoryId)
                .eq("status", 0);
        List<CategoryEntity> children = categoryMapper.selectList(wrapper);

        return children;
    }

    @Override
    public boolean hasCategoryById(Long categoryId) {
        CategoryEntity category = categoryMapper.selectById(categoryId);
        return category != null;
    }

    @Override
    public boolean checkNameUnique(CategoryEntity category) {
        Long categoryId = StringUtils.isNull(category.getCategoryId()) ? -1L : category.getCategoryId();
        CategoryEntity info = categoryMapper.selectOne(new LambdaQueryWrapperX<CategoryEntity>()
                .eq(CategoryEntity::getCategoryName, category.getCategoryName()));
        if (StringUtils.isNotNull(info) && info.getCategoryId().longValue() != categoryId.longValue()) {
            return false;
        }
        return true;

    }

    @Override
    public boolean checkSlugUnique(CategoryEntity category) {
        Long categoryId = StringUtils.isNull(category.getCategoryId()) ? -1L : category.getCategoryId();
        CategoryEntity info = categoryMapper.selectOne(new LambdaQueryWrapperX<CategoryEntity>()
                .eq(CategoryEntity::getSlug, category.getSlug()));
        if (StringUtils.isNotNull(info) && info.getCategoryId().longValue() != categoryId.longValue()) {
            return false;
        }
        return true;
    }

    @Override
    public boolean hasChildByCategoryId(Long categoryId) {
        Long result = categoryMapper.selectCount("parent_id", categoryId);
        return result > 0;
    }


    /**
     * 是否可以添加分类
     *
     * @param category
     * @return true可以添加
     */
    private boolean checkAddOrUpdate(CategoryEntity category) {
        if (!checkSlugUnique(category)) {
            throw new ServiceException(CampusBizCodeEnum.CATEGORY_SLUG_REPEAT.getMsg(), CampusBizCodeEnum.CATEGORY_SLUG_REPEAT.getCode());
        }
        if (!checkNameUnique(category)) {
            throw new ServiceException(CampusBizCodeEnum.CATEGORY_NAME_REPEAT.getMsg(), CampusBizCodeEnum.CATEGORY_NAME_REPEAT.getCode());
        }
        return true;
    }

}




