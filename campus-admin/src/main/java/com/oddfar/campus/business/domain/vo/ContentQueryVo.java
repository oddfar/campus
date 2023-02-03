package com.oddfar.campus.business.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author zhiyuan
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ContentQueryVo {
    private static final long serialVersionUID = 1L;

    /**
     * 内容id
     */
    private Long contentId;

    /**
     * 分类id
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long categoryId;

    /**
     * 用户id
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long userId;

    /**
     * 内容
     */
    private String content;


}
