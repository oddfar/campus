package com.oddfar.campus.business.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.oddfar.campus.business.domain.entity.TagEntity;
import lombok.Data;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
public class ContentVo {
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
     * 文件数量
     */
    private int fileCount;

    /**
     * 点赞数量
     */
    private Long loveCount;

    /**
     * 0不匿名，1匿名
     */
    private Integer isAnonymous;

    /**
     * 文件URL列表
     */
    private List<String> fileUrl;

//    private SysUserEntity userEntity;

//    private CategoryEntity category;

    private List<TagEntity> tags;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private Map<String, Object> params;

    public Map<String, Object> getParams()
    {
        if (params == null)
        {
            params = new HashMap<>();
        }
        return params;
    }
}
