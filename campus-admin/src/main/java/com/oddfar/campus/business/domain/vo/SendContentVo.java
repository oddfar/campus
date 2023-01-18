package com.oddfar.campus.business.domain.vo;

import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * 发表信息墙信息vo
 */
@Data
public class SendContentVo {

    /**
     * 分类id
     */
    @NotNull(message = "分类不能为空")
    private Long categoryId;

    /**
     * 内容
     */
    @Size(min = 0, max = 500, message = "内容长度不能超过500个字符")
    private String content;

    /**
     * 0不匿名，1匿名
     */
    @Min(value = 0,message = "匿名参数错误")
    @Max(value = 1,message = "匿名参数错误")
    @NotNull(message = "匿名参数不能为空")
    private Integer isAnonymous;

    /**
     * 类型：0文字,1图片,2视频
     */
    @Min(value = 0,message = "类型参数错误")
    @Max(value = 2,message = "类型参数错误")
    @NotNull(message = "类型参数不能为空")
    private Integer type;

    /**
     * 文件id信息
     */
    private List<Long> fileList;
}
