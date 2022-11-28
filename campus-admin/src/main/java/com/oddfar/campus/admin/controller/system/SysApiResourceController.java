package com.oddfar.campus.admin.controller.system;

import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.domain.entity.SysResourceEntity;
import com.oddfar.campus.framework.service.SysResourceService;
import com.oddfar.campus.framework.web.service.SysPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.oddfar.campus.common.utils.SecurityUtils.getUserId;

@RestController
@RequestMapping("/system/resource")
public class SysApiResourceController {
    @Autowired
    private SysResourceService resourceService;
    @Autowired
    private SysPermissionService permissionService;

    /**
     * 加载对应角色资源列表树
     */
    @GetMapping(value = "/roleApiTreeselect/{roleId}")
    public R roleMenuTreeSelect(@PathVariable("roleId") Long roleId) {
        List<SysResourceEntity> resources = resourceService.selectApiResourceList(getUserId());
        R ajax = R.ok();
        ajax.put("checkedKeys", resourceService.selectResourceListByRoleId(roleId));
        ajax.put("resources", resourceService.buildResourceTreeSelect(resources));
        return ajax;
    }

    /**
     * 修改对应角色api资源
     */
    @PutMapping(value = "/roleApi")
    public R editRoleResource(Long roleId, Long[] resourceIds) {
        resourceService.editRoleResource(roleId, resourceIds);
        //更新redis缓存权限数据
        permissionService.resetLoginUserRoleCache(roleId);
        return R.ok();

    }


}
