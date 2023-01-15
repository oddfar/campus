package com.oddfar.campus.business.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.common.core.BaseMapperX;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import com.oddfar.campus.common.domain.PageResult;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface CategoryMapper extends BaseMapperX<CategoryEntity> {

    default PageResult<CategoryEntity> selectPage(CategoryEntity category) {

        return selectPage(new LambdaQueryWrapperX<CategoryEntity>()
                .likeIfPresent(CategoryEntity::getCategoryName, category.getCategoryName())
                .eqIfPresent(CategoryEntity::getStatus, category.getStatus())
        );
    }

    /**
     * 获取一级分类
     *
     * @return
     */
    default List<CategoryEntity> selectPrimary() {

        return selectList(new QueryWrapper<CategoryEntity>().eq("parent_id", 0).eq("status", 0));
    }
}




