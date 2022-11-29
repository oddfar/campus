package com.oddfar.campus.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.business.mapper.CategoryMapper;
import com.oddfar.campus.business.service.CategoryService;
import org.springframework.stereotype.Service;

/**
* @author ningzhiyuan
* @description 针对表【campus_meta】的数据库操作Service实现
* @createDate 2022-11-29 14:19:13
*/
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, CategoryEntity>
    implements CategoryService {

}




