package com.oddfar.campus.business.controller.web;

import com.oddfar.campus.business.domain.entity.ContentEntity;
import com.oddfar.campus.business.domain.vo.ContentQueryVo;
import com.oddfar.campus.business.domain.vo.ContentVo;
import com.oddfar.campus.business.domain.vo.SendContentVo;
import com.oddfar.campus.business.service.ContentLoveService;
import com.oddfar.campus.business.service.ContentService;
import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.core.page.PageUtils;
import com.oddfar.campus.common.core.text.Convert;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import com.oddfar.campus.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/campus")
@ApiResource(name = "信息墙api", appCode = "campus", resBizType = ResBizTypeEnum.BUSINESS)
public class ContentInfoController {

    @Autowired
    private ContentService contentService;
    @Autowired
    private ContentLoveService loveService;

    /**
     * 查询信息墙内容列表
     *
     * @param contentQueryVo 查询参数
     * @return
     */
    @Anonymous
    @GetMapping(value = "/contentList", name = "查询信息墙内容列表")
    public R getContentList(ContentQueryVo contentQueryVo) {
        //最新墙 热门墙等等。。。
        String meta = Convert.toStr(contentQueryVo.getCategoryId(), "1");
        PageResult<ContentVo> page = null;
        switch (meta) {
            case "1":
                //最新墙
                page = contentService.newestPage();
                break;
            case "2":
                //热门墙
                page = contentService.hotPage();
                break;
            default:
                page = contentService.newestPage();
                break;
        }

        R r = new R();
        r.put(page);
        //获取点赞列表
        List<Long> loveContentIds = new ArrayList<>();
        if (SecurityUtils.isLogin()) {
            List<Long> ids = loveService.getLoveInfo(SecurityUtils.getUserId(), page.getRows());
            loveContentIds.addAll(ids);
        }
        r.put("loveContentIds", loveContentIds);
        return r;
    }

    /**
     * 查询简单热门信息墙内容列表
     *
     * @return
     */
    @Anonymous
    @GetMapping(value = "/simpleHotContent", name = "查询信息墙内容列表")
    public R getSimpleHotContent() {

        List<ContentEntity> simpleHotContent = contentService.getSimpleHotContent();
        return R.ok(simpleHotContent);
    }

    /**
     * 根据contentId查询信息墙详细内容
     */
    @Anonymous
    @GetMapping(value = "/getContent", name = "查询信息墙详细内容")
    public R getContentById(Long id) {
        ContentEntity contentEntity = new ContentEntity();
        contentEntity.setContentId(id);
        contentEntity.setStatus(1);

        if (SecurityUtils.isLogin()) {
            if (contentService.checkOwnContent(contentEntity.getContentId())) {
                contentEntity.setStatus(null);
            }
        }
        ContentVo contentVo = contentService.selectContentByContentId(contentEntity);
        R r = new R();
        if (contentVo != null) {
            r.put("data", contentVo);
            if (SecurityUtils.isLogin()) {
                r.put("isLove", loveService.isLove(SecurityUtils.getUserId(), contentVo.getContentId()));
            } else {
                r.put("isLove", false);
            }

        }
        return r;
    }

    /**
     * 查询自己的点赞信息墙列表
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/getOwnLoveContent", name = "查询点赞的信息墙列表")
    public R getOwnLoveContent() {
        //获取点赞列表
        Long userId = SecurityUtils.getUserId();
        PageResult<ContentVo> contentList = contentService.getLoveContentByUserId(userId);

        return R.ok().put(contentList);

    }

    /**
     * 查询自己的信息墙列表
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/getOwnContent", name = "查询自己的信息墙列表")
    public R getOwnContent() {
        PageResult<ContentVo> contentList = contentService.getOwnContent();

        return R.ok().put(contentList);
    }

    /**
     * 发表信息墙
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PostMapping(value = "/sendContent", name = "发表信息墙")
    public R toContent(@Validated @RequestBody SendContentVo sendContentVo) {

        return R.ok(contentService.sendContent(sendContentVo));
    }

    /**
     * 删除校园墙内容
     */
    @PreAuthorize("@ss.resourceAuth()")
    @DeleteMapping("/delContent/{contentIds}")
    public R delContent(@PathVariable Long contentIds) {
        return R.ok(contentService.removeById(contentIds));
    }

    /**
     * 查看自己的信息墙
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PostMapping("/ownContents")
    public R ownContents() {
        ContentEntity contentEntity = new ContentEntity();
        contentEntity.setUserId(SecurityUtils.getUserId());
        PageUtils.startPage(10);
        PageResult<ContentVo> page = contentService.page(contentEntity);
        return R.ok().put(page);
    }

}
