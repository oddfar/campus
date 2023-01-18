package com.oddfar.campus.business.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ToCommentVo {

    /**
     * 评论主键
     */
    private Long commentId;

    /**
     * 内容id
     */
    private Long contentId;

    /**
     * 评论内容
     */
    private String coContent;

}
