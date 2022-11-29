package com.oddfar.campus.business.controller;

import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.business.service.ContentService;
import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/content")
@ApiResource(name = "内容控制" , appCode = "campus" , resBizType = ResBizTypeEnum.BUSINESS)
public class ContentController {
    @Autowired
    private ContentService contentService;

    @GetMapping(value = "list" , name = "分页")
//    @PreAuthorize("@ss.resourceAuth()")
    @Anonymous
    public R page(ContentEntity contentEntity) {
        PageResult<ContentVo> page = contentService.page(contentEntity);

        return R.ok().put(page);
    }

}
