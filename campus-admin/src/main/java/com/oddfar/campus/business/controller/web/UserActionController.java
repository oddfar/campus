package com.oddfar.campus.business.controller.web;

import com.oddfar.campus.business.service.CampusFileService;
import com.oddfar.campus.business.service.ContentLoveService;
import com.oddfar.campus.business.service.ContentService;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import com.oddfar.campus.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * 用户操作api
 *
 * @author 致远
 */
@RestController
@RequestMapping("/campus")
@ApiResource(name = "用户操作api", appCode = "campus", resBizType = ResBizTypeEnum.BUSINESS)
public class UserActionController {

    @Autowired
    private ContentService contentService;
    @Autowired
    private ContentLoveService contentLoveService;
    @Autowired
    private CampusFileService campusFileService;


    /**
     * 点赞
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/zan/{contentId}", name = "点赞")
    public R zanContent(@PathVariable Long contentId) {
        Long userId = SecurityUtils.getUserId();

        return R.ok(contentLoveService.zanContent(userId, contentId));
    }

    /**
     * 图片文件上传
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PostMapping(value = "/imageUpload", name = "图片文件上传")
    public R imageUpload(MultipartFile file) {
        if (!file.isEmpty()) {
            return R.ok(campusFileService.fileUploadImage(file));
        }
        return R.error("上传异常");
    }

    /**
     * 视频文件上传
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PostMapping(value = "/videoUpload", name = "视频文件上传")
    public R videoUpload(MultipartFile file) {
        if (!file.isEmpty()) {

            return R.ok(campusFileService.fileUploadVideo(file));
        }
        return R.error("上传异常");
    }


}
