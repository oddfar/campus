package com.oddfar.campus.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.entity.ContentLoveEntity;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.business.enums.CampusBizCodeEnum;
import com.oddfar.campus.business.mapper.ContentLoveMapper;
import com.oddfar.campus.business.mapper.ContentMapper;
import com.oddfar.campus.business.service.CategoryService;
import com.oddfar.campus.business.service.ContentLoveService;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import com.oddfar.campus.common.exception.ServiceException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
* @author 致远

*/
@Service
public class ContentLoveServiceImpl extends ServiceImpl<ContentLoveMapper, ContentLoveEntity>
    implements ContentLoveService {

    @Resource
    private ContentMapper contentMapper;
    @Resource
    private CategoryService categoryService;
    @Resource
    private ContentLoveMapper contentLoveMapper;

    @Override
    public int zanContent(Long userId, Long contentId) {
        ContentEntity contentEntity = contentMapper.selectById(contentId);
        if (contentEntity == null) {
            throw new ServiceException(CampusBizCodeEnum.CONTENT_OPERATION_PROHIBITED.getMsg(),
                    CampusBizCodeEnum.CONTENT_OPERATION_PROHIBITED.getCode());

        }
        if (contentEntity.getStatus() != 1) {
            throw new ServiceException(CampusBizCodeEnum.CONTENT_OPERATION_PROHIBITED.getMsg(),
                    CampusBizCodeEnum.CONTENT_OPERATION_PROHIBITED.getCode());
        }
        //是否点过赞
        boolean zan = contentLoveMapper.isZan(userId, contentId);
        if (zan) {
            //取消点赞
            contentEntity.setLoveCount(contentEntity.getLoveCount() - 1);
            contentMapper.updateById(contentEntity);
            contentLoveMapper.cancelLove(userId, contentId);
            return 0;
        } else {
            contentEntity.setLoveCount(contentEntity.getLoveCount() + 1);
            contentMapper.updateById(contentEntity);
            ContentLoveEntity contentLove = new ContentLoveEntity(userId, contentId);
            contentLoveMapper.insert(contentLove);
            return 1;
        }
    }


    @Override
    public boolean isLove(Long userId, Long contentId) {
        ContentLoveEntity loveEntity = contentLoveMapper.selectOne(new LambdaQueryWrapperX<ContentLoveEntity>()
                .eq(ContentLoveEntity::getUserId, userId)
                .eq(ContentLoveEntity::getContentId, contentId));

        return loveEntity != null;
    }

    @Override
    public List<Long> getLoveInfo(Long userId, List<ContentVo> contentVos) {
        List<Long> contentIds = contentVos.stream().map(ContentVo::getContentId).collect(Collectors.toList());
        return contentLoveMapper.getLoveList(userId, contentIds);
    }

}




