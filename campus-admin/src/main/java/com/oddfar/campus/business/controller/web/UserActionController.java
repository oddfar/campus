package com.oddfar.campus.business.controller.web;

import com.oddfar.campus.business.domain.entity.CampusFileEntity;
import com.oddfar.campus.business.service.CampusFileService;
import com.oddfar.campus.business.service.ContentLoveService;
import com.oddfar.campus.business.service.ContentService;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.domain.model.LoginUser;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import com.oddfar.campus.common.utils.SecurityUtils;
import com.oddfar.campus.framework.api.file.FileUploadUtils;
import com.oddfar.campus.framework.api.file.MimeTypeUtils;
import com.oddfar.campus.framework.expander.SysConfigExpander;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import static com.oddfar.campus.common.utils.SecurityUtils.getLoginUser;

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
     * 文件上传
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/fileUpload", name = "文件上传")
    public R avatar(MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            LoginUser loginUser = getLoginUser();
            String location = FileUploadUtils.upload(SysConfigExpander.getCampusFilePath(), file, MimeTypeUtils.IMAGE_VIDEO_EXTENSION);
            CampusFileEntity campusFileEntity = new CampusFileEntity(loginUser.getUserId(), location);
            campusFileService.save(campusFileEntity);
            return R.ok("上传成功");

        }
        return R.error("上传异常");
    }
}
