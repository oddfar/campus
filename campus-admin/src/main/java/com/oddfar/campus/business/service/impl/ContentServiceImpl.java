package com.oddfar.campus.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.CampusFileVo;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.business.mapper.ContentLoveMapper;
import com.oddfar.campus.business.mapper.ContentMapper;
import com.oddfar.campus.business.service.CampusFileService;
import com.oddfar.campus.business.service.CategoryService;
import com.oddfar.campus.business.service.ContentService;
import com.oddfar.campus.common.domain.PageResult;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
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
    @Resource
    private CampusFileService fileService;

    @Override
    public PageResult<ContentVo> page(ContentEntity contentEntity) {
        //设置分页 分类等其他参数
        setContentEntity(contentEntity);

        List<ContentVo> contentVos = contentMapper.selectContentList(contentEntity);
        //获取文件url列表
        setFileListByContentVos(contentVos);

        return new PageResult<ContentVo>(contentVos, contentVos.size());
    }

    @Override
    public PageResult<ContentVo> newestPage(ContentEntity contentEntity) {
        contentEntity.setCategoryId(null);
        return page(contentEntity);
    }


    @Override
    public ContentVo selectContentByContentId(ContentEntity contentEntity) {
        ContentVo contentVo = contentMapper.selectContentByContent(contentEntity);
        //设置文件
        setFileByContentEntity(contentVo);
        return contentVo;
    }

    @Override
    public int updateContent(ContentEntity content) {

        return contentMapper.updateById(content);
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

    /**
     * 设置信息墙列表的文件url列表
     * @param contentVos
     */
    private void setFileListByContentVos(List<ContentVo> contentVos){

        List<Long> contentIds = contentVos.stream().map(ContentVo::getContentId).collect(Collectors.toList());
        //获取文件
        List<CampusFileVo> contentFiles = fileService.getContentFile(contentIds);
        //把文件list转map
        Map<Long, CampusFileVo> fileVoMap =
                contentFiles.stream().collect(Collectors.toMap(CampusFileVo::getContentId, Function.identity()));
        //文件信息加入到ContentVo集合
        contentVos.forEach(vo -> {
            if(fileVoMap.containsKey(vo.getContentId())){
                vo.setFileUrl(fileVoMap.get(vo.getContentId()).getFileUrls());
            }
        });

    }

    /**
     * 设置信息墙的文件
     * @param contentVo
     */
    private void setFileByContentEntity(ContentVo contentVo){
        CampusFileVo contentFile = fileService.getContentFile(contentVo.getContentId());

        contentVo.setFileUrl(contentFile.getFileUrls());
    }

}




