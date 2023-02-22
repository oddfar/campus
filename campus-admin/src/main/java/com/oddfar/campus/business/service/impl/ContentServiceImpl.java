package com.oddfar.campus.business.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageInfo;
import com.oddfar.campus.business.core.expander.CampusConfigExpander;
import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.entity.ContentTagEntity;
import com.oddfar.campus.business.domain.vo.CampusFileVo;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.business.domain.vo.SendContentVo;
import com.oddfar.campus.business.enums.CampusBizCodeEnum;
import com.oddfar.campus.business.mapper.ContentLoveMapper;
import com.oddfar.campus.business.mapper.ContentMapper;
import com.oddfar.campus.business.service.CampusFileService;
import com.oddfar.campus.business.service.CategoryService;
import com.oddfar.campus.business.service.ContentService;
import com.oddfar.campus.business.service.TagService;
import com.oddfar.campus.common.core.page.PageUtils;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.exception.ServiceException;
import com.oddfar.campus.common.utils.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;


@Service
public class ContentServiceImpl extends ServiceImpl<ContentMapper, ContentEntity>
        implements ContentService {

    private static final int WEB_PAGE_SIZE = 5;
    @Resource
    private ContentMapper contentMapper;
    @Resource
    private CategoryService categoryService;
    @Resource
    private ContentLoveMapper contentLoveMapper;
    @Resource
    private CampusFileService fileService;
    @Resource
    private TagService tagService;

    @Override
    public PageResult<ContentVo> page(ContentEntity contentEntity) {
        //设置分类等其他参数
        setQueryContentEntity(contentEntity);

        List<ContentVo> contentVos = contentMapper.selectContentList(contentEntity);
        setAnonymous(contentVos);
        //获取文件url列表
        setFileListByContentVos(contentVos);
        //获取标签
        setTagListByContentVos(contentVos);

        return PageUtils.getPageResult(contentVos);
    }

    @Override
    public PageResult<ContentVo> newestPage() {
        ContentEntity contentEntity = new ContentEntity();
        contentEntity.getParams().put("orderBy", "newest");
        contentEntity.setStatus(1);
        //开始分页
        PageUtils.startPage(WEB_PAGE_SIZE);

        return page(contentEntity);
    }

    @Override
    public PageResult<ContentVo> hotPage() {
        ContentEntity contentEntity = new ContentEntity();
        contentEntity.setStatus(1);
        contentEntity.getParams().put("orderBy", "hotContent");
        //开始分页
        PageUtils.startPage(WEB_PAGE_SIZE);

        return page(contentEntity);
    }

    @Override
    public PageResult<ContentVo> getLoveContentByUserId(Long userId) {
        //开始分页
        PageUtils.startPage(WEB_PAGE_SIZE);
        List<Long> contentIds = contentMapper.selectLoveContentList(userId);
        //获取总点赞的墙数量
        long total = new PageInfo(contentIds).getTotal();
        List<ContentVo> contentVos = contentMapper.selectContentByIds(contentIds);

        return new PageResult<>(contentVos, total);
    }

    @Override
    public PageResult<ContentVo> getOwnContent() {

        ContentEntity contentEntity = new ContentEntity();
        contentEntity.setUserId(SecurityUtils.getUserId());
        contentEntity.getParams().put("orderBy", "newest");
        //开始分页
        PageUtils.startPage(WEB_PAGE_SIZE);
        return page(contentEntity);
    }


    @Override
    public ContentVo selectContentByContentId(ContentEntity contentEntity) {
        ContentVo contentVo = contentMapper.selectContentByContent(contentEntity);
        if (contentVo != null) {
            //设置文件
            setFileByContentEntity(contentVo);
        }
        return contentVo;
    }

    @Override
    @Transactional
    public int sendContent(SendContentVo sendContentVo) {

        ContentEntity contentEntity = new ContentEntity();
        assertAllowed(sendContentVo);
        BeanUtil.copyProperties(sendContentVo, contentEntity);

        //设置信息
        contentEntity.setUserId(SecurityUtils.getUserId());
        if (sendContentVo.getFileList() != null && sendContentVo.getFileList().size() > 0) {
            contentEntity.setFileCount(sendContentVo.getFileList().size());
            //保存数据库
            fileService.updateContentFile(sendContentVo.getFileList(), contentEntity.getContentId());
        } else {
            contentEntity.setFileCount(0);
            contentEntity.setType(0);
        }

        contentEntity.setContentId(IdWorker.getId());
        contentEntity.setStatus(0);

        return contentMapper.insert(contentEntity);
    }

    @Override
    public int updateContent(ContentEntity content) {

        return contentMapper.updateById(content);
    }

    @Override
    public List<ContentEntity> getSimpleHotContent() {

        return contentMapper.getSimpleHotContent();
    }

    @Override
    public boolean checkOwnContent(Long contentId) {
        ContentEntity contentEntity = contentMapper.selectById(contentId);
        if (contentEntity.getUserId().equals(SecurityUtils.getUserId())) {
            return true;
        } else {
            return false;
        }
    }


    /**
     * 文件 分类核对
     *
     * @param sendContentVo
     */
    private void assertAllowed(SendContentVo sendContentVo) {

        CategoryEntity category = categoryService.getById(sendContentVo.getCategoryId());
        if (category == null) {
            throw new ServiceException(CampusBizCodeEnum.CATEGORY_NOT_EXIST.getMsg(),
                    CampusBizCodeEnum.CATEGORY_NOT_EXIST.getCode());
        }

        if (sendContentVo.getType() == 0) {
            //类别为文字时候，内容不能为空
            if (sendContentVo.getContent().length() == 0) {
                throw new ServiceException(CampusBizCodeEnum.CONTENT_NOT_NULL.getMsg(),
                        CampusBizCodeEnum.CONTENT_NOT_NULL.getCode());
            }
            sendContentVo.setFileList(null);
        } else {
            if (sendContentVo.getFileList() == null) {
                throw new ServiceException(CampusBizCodeEnum.CONTENT_FILE_COUNT_EXCEPTION.getMsg(),
                        CampusBizCodeEnum.CONTENT_FILE_COUNT_EXCEPTION.getCode());
            }
            if (sendContentVo.getType() == 1) {
                //类别为图片时候，文件数量最大为3
                if (sendContentVo.getFileList().size() < 1 || sendContentVo.getFileList().size() > 3) {
                    throw new ServiceException(CampusBizCodeEnum.CONTENT_FILE_COUNT_EXCEPTION.getMsg(),
                            CampusBizCodeEnum.CONTENT_FILE_COUNT_EXCEPTION.getCode());
                }
            }
            if (sendContentVo.getType() == 2) {
                //类别为视频，文件数量为1
                if (sendContentVo.getFileList().size() != 1) {
                    throw new ServiceException(CampusBizCodeEnum.CONTENT_FILE_COUNT_EXCEPTION.getMsg(),
                            CampusBizCodeEnum.CONTENT_FILE_COUNT_EXCEPTION.getCode());
                }
            }
            //判断文件是否都存在
            if (!fileService.fileExist(sendContentVo.getFileList(), sendContentVo.getType())) {
                throw new ServiceException(CampusBizCodeEnum.CONTENT_FILE_EXCEPTION.getMsg(),
                        CampusBizCodeEnum.CONTENT_FILE_EXCEPTION.getCode());
            }
        }

    }

    /**
     * 用户发表信息墙时，设置其参数
     *
     * @param contentEntity
     */
    private void setAddContentEntity(ContentEntity contentEntity) {


    }

    /**
     * 查询信息墙时，设置分类等其他参数
     *
     * @param contentEntity
     */
    private void setQueryContentEntity(ContentEntity contentEntity) {

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
     *
     * @param contentVos
     */
    private void setFileListByContentVos(List<ContentVo> contentVos) {

        List<Long> contentIds = contentVos.stream().map(ContentVo::getContentId).collect(Collectors.toList());
        //获取文件
        if (contentIds.size() <= 0) {
            return;
        }
        List<CampusFileVo> contentFiles = fileService.getContentFile(contentIds);
        //把文件list转map
        Map<Long, CampusFileVo> fileVoMap =
                contentFiles.stream().collect(Collectors.toMap(CampusFileVo::getContentId, Function.identity()));
        //文件信息加入到ContentVo集合
        contentVos.forEach(vo -> {
            if (fileVoMap.containsKey(vo.getContentId())) {
                vo.setFileUrl(fileVoMap.get(vo.getContentId()).getFileUrls());
            }
        });

    }

    /**
     * 设置信息墙列表的标签列表
     *
     * @param contentVos
     */
    private void setTagListByContentVos(List<ContentVo> contentVos) {

        List<Long> contentIds = contentVos.stream().map(ContentVo::getContentId).collect(Collectors.toList());
        if (contentIds.size() <= 0) {
            return;
        }
        //获取有关系的tag列表
        List<ContentTagEntity> contentTags = tagService.getTagListByContentIds(contentIds);
        //把标签list转map
        Map<Long, List<ContentTagEntity>> tagMap = contentTags.stream().collect(Collectors.groupingBy(ContentTagEntity::getContentId));
        //文件信息加入到ContentVo集合
        contentVos.forEach(vo -> {
            if (tagMap.containsKey(vo.getContentId())) {
                vo.setTags(tagMap.get(vo.getContentId()));
            }
        });

    }

    /**
     * 设置信息墙的文件
     *
     * @param contentVo
     */
    private void setFileByContentEntity(ContentVo contentVo) {
        if (contentVo.getType() != 0) {

        }
        CampusFileVo contentFile = fileService.getContentFile(contentVo.getContentId());
        if (contentFile != null) {
            contentVo.setFileUrl(contentFile.getFileUrls());
        }

    }

    /**
     * 设置匿名数据
     *
     * @param contentVos
     */
    private void setAnonymous(List<ContentVo> contentVos) {
        for (ContentVo contentVo : contentVos) {
            if (contentVo.getIsAnonymous() == 1) {
                contentVo.setUserId(null);
                Map<String, Object> params = contentVo.getParams();
                params.put("avatar", CampusConfigExpander.getCampusAnonymousImage());
                params.put("nickName", "匿名用户");
                params.put("userId", null);
                params.put("userName", null);

            }
        }

    }


}




