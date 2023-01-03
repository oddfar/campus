package com.oddfar.campus.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.business.mapper.ContentLoveMapper;
import com.oddfar.campus.business.mapper.ContentMapper;
import com.oddfar.campus.business.service.CategoryService;
import com.oddfar.campus.business.service.ContentService;
import com.oddfar.campus.common.domain.PageResult;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class ContentServiceImpl extends ServiceImpl<ContentMapper, ContentEntity>
        implements ContentService {

    @Resource
    private ContentMapper contentMapper;
    @Resource
    private CategoryService categoryService;
    @Resource
    private ContentLoveMapper contentLoveMapper;

    @Override
    public PageResult<ContentVo> page(ContentEntity contentEntity) {
        //设置分页 分类等其他参数
        setContentEntity(contentEntity);

        List<ContentVo> contentVos = contentMapper.selectContentList(contentEntity);

        return new PageResult<ContentVo>(contentVos, contentVos.size());
    }

    @Override
    public PageResult<ContentVo> newestPage(ContentEntity contentEntity) {
        contentEntity.setCategoryId(null);
        return page(contentEntity);
    }


    @Override
    public ContentVo selectContentByContentId(ContentEntity contentEntity) {

        return contentMapper.selectContentByContent(contentEntity);
    }

    @Override
    public int updateContent(ContentEntity content) {

        return 0;
    }


    /**
     * 设置分页 分类 等其他参数
     *
     * @param contentEntity
     */
    private void setContentEntity(ContentEntity contentEntity) {
        //设置分页
        int firstIndex = (contentEntity.getPageNum() - 1) * contentEntity.getPageSize();
        contentEntity.setPageNum(firstIndex);

        CategoryEntity category = categoryService.selectCategoryById(contentEntity.getCategoryId());
        //查询当前分类及其子类
        if (category != null && category.getParentId() == 0 && category.getChildren() != null) {
            List<Long> categoryIds = category.getChildren().stream()
                    .map(CategoryEntity::getCategoryId).collect(Collectors.toList());
            categoryIds.add(contentEntity.getCategoryId());
            contentEntity.getParams().put("categoryIds", categoryIds);
        }
        //查询当前分类
        if (category != null && (category.getParentId() != 0 || category.getChildren() == null)) {
            List<Long> categoryIds = new ArrayList<>();
            categoryIds.add(category.getCategoryId());
            contentEntity.getParams().put("categoryIds", categoryIds);
        }
    }

}




