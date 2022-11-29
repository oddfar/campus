package com.oddfar.campus.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.business.mapper.ContentMapper;
import com.oddfar.campus.business.service.ContentService;
import com.oddfar.campus.common.domain.PageResult;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ningzhiyuan
 * @description 针对表【campus_content】的数据库操作Service实现
 * @createDate 2022-11-29 14:08:29
 */
@Service
public class ContentServiceImpl extends ServiceImpl<ContentMapper, ContentEntity>
        implements ContentService {

    @Resource
    private ContentMapper contentMapper;

    @Override
    public PageResult<ContentVo> page(ContentEntity contentEntity) {
        List<ContentVo> contentVos =
                contentMapper.selectContentList(contentEntity);
        return new PageResult<ContentVo>(contentVos,contentVos.size());
    }
}




