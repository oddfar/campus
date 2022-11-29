package com.oddfar.campus.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.common.domain.PageResult;

/**
* @author ningzhiyuan
* @description 针对表【campus_content】的数据库操作Service
* @createDate 2022-11-29 14:08:29
*/
public interface ContentService extends IService<ContentEntity> {

    PageResult<ContentVo> page(ContentEntity contentEntity);

}
