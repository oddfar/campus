package com.oddfar.campus.admin.controller.system;

import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.domain.entity.SysDictTypeEntity;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import com.oddfar.campus.framework.service.SysDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/system/dict/type")
@ApiResource(name = "字典类型管理" , resBizType = ResBizTypeEnum.SYSTEM)
public class SysDictTypeController {

    @Autowired
    private SysDictTypeService dictTypeService;

    @PreAuthorize("@ss.hasPermi('system:dict:list')")
    @GetMapping("/list")
    public R list(SysDictTypeEntity sysDictTypeEntity) {
        PageResult<SysDictTypeEntity> page = dictTypeService.page(sysDictTypeEntity);
        return R.ok().put(page);
    }

    /**
     * 查询字典类型详细
     */
    @PreAuthorize("@ss.hasPermi('system:dict:query')")
    @GetMapping(value = "/{dictId}")
    public R getInfo(@PathVariable Long dictId) {
        return R.ok(dictTypeService.selectDictTypeById(dictId));
    }

    /**
     * 新增字典类型
     */
    @PreAuthorize("@ss.hasPermi('system:dict:add')")
    @PostMapping
    public R add(@Validated @RequestBody SysDictTypeEntity dict) {
        if (!dictTypeService.checkDictTypeUnique(dict)) {
            return R.error("新增字典'" + dict.getDictName() + "'失败，字典类型已存在");
        }

        return R.ok(dictTypeService.insertDictType(dict));
    }

    /**
     * 修改字典类型
     */
    @PreAuthorize("@ss.hasPermi('system:dict:edit')")
    @PutMapping
    public R edit(@Validated @RequestBody SysDictTypeEntity dict) {
        if (!dictTypeService.checkDictTypeUnique(dict)) {
            return R.error("修改字典'" + dict.getDictName() + "'失败，字典类型已存在");
        }
        return R.ok(dictTypeService.updateDictType(dict));
    }

    /**
     * 删除字典类型
     */
    @PreAuthorize("@ss.hasPermi('system:dict:remove')")
    @DeleteMapping("/{dictIds}")
    public R remove(@PathVariable Long[] dictIds) {
        dictTypeService.deleteDictTypeByIds(dictIds);
        return R.ok();
    }

    /**
     * 刷新字典缓存
     */
    @PreAuthorize("@ss.hasPermi('system:dict:remove')")
    @DeleteMapping("/refreshCache")
    public R refreshCache() {
        dictTypeService.resetDictCache();
        return R.ok();
    }

    /**
     * 获取字典选择框列表
     */
    @GetMapping("/optionselect")
    public R optionselect() {
        List<SysDictTypeEntity> dictTypes = dictTypeService.selectDictTypeAll();
        return R.ok(dictTypes);
    }

}
