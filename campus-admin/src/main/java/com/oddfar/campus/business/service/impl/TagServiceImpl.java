package com.oddfar.campus.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.oddfar.campus.business.domain.entity.ContentTagEntity;
import com.oddfar.campus.business.domain.entity.TagEntity;
import com.oddfar.campus.business.enums.CampusBizCodeEnum;
import com.oddfar.campus.business.mapper.TagMapper;
import com.oddfar.campus.business.service.TagService;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.exception.ServiceException;
import com.oddfar.campus.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagServiceImpl extends ServiceImpl<TagMapper, TagEntity>
        implements TagService {

    @Autowired
    private TagMapper tagMapper;

    @Override
    public PageResult<TagEntity> page(TagEntity tag) {
        return tagMapper.selectPage(tag);
    }

    @Override
    public int insertTag(TagEntity tag) {
        checkAddOrUpdate(tag);
        return tagMapper.insert(tag);
    }

    @Override
    public int updateTag(TagEntity tag) {
        checkAddOrUpdate(tag);
        return tagMapper.updateById(tag);
    }

    @Override
    public List<ContentTagEntity> getTagListByContentIds(List<Long> contentIds) {
        List<ContentTagEntity> tagEntities = tagMapper.selectTagListByContentIds(contentIds);
        return tagEntities;
    }

    @Override
    public boolean checkNameUnique(TagEntity tag) {
        Long tagId = StringUtils.isNull(tag.getTagId()) ? -1L : tag.getTagId();
        TagEntity info = tagMapper.selectOne(new LambdaQueryWrapperX<TagEntity>()
                .eq(TagEntity::getTagName, tag.getTagName()));
        if (StringUtils.isNotNull(info) && info.getTagId().longValue() != tagId.longValue()) {
            return false;
        }
        return true;
    }

    /**
     * 是否可以添加标签
     *
     * @param tagEntity
     * @return true可以添加
     */
    private boolean checkAddOrUpdate(TagEntity tagEntity) {
        if (!checkNameUnique(tagEntity)) {
            throw new ServiceException(CampusBizCodeEnum.TAG_NAME_REPEAT.getMsg(),
                    CampusBizCodeEnum.TAG_NAME_REPEAT.getCode());
        }

        return true;
    }

}
