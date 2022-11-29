package com.oddfar.campus.business.domain.vo;

import com.oddfar.campus.business.domain.entity.CategoryEntity;
import com.oddfar.campus.business.domain.entity.TagEntity;
import com.oddfar.campus.common.domain.entity.SysUserEntity;
import lombok.Data;

import java.util.List;

@Data
public class ContentVo  {
    private static final long serialVersionUID = 1L;

    /**
     * 内容id
     */
    private Long contentId;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 类别id
     */
    private Long categoryId;

    /**
     * 内容
     */
    private String content;

    /**
     * 状态：0审核,1正常,2下架
     */
    private Integer status;

    /**
     * 类型：0文字,1图片,2视频
     */
    private Integer type;

    /**
     * 文件id
     */
    private Long fileNumber;

    /**
     * 0不匿名，1匿名
     */
    private Integer isAnonymous;

    /**
     * 文件URL列表
     */
    private List<String> fileUrl;


    private SysUserEntity userEntity;

    private CategoryEntity category;

    private TagEntity tag;

}
