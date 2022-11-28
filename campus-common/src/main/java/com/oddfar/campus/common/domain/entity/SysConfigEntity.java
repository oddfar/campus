package com.oddfar.campus.common.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.oddfar.campus.common.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author zhiyuan
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "sys_config参数配置表")
@TableName("sys_config")
public class SysConfigEntity extends BaseEntity  {
    private static final long serialVersionUID = 1L;

    //    @JsonFormat(shape = JsonFormat.Shape.STRING)
    @ApiModelProperty(value = "配置id")
    @TableId("config_id")
    private Long configId;

    @ApiModelProperty(value = "参数名称")
    private String configName;

    @ApiModelProperty(value = "参数键名")
    private String configKey;

    @ApiModelProperty(value = "参数键值")
    private String configValue;

    @ApiModelProperty(value = "系统内置（Y是 N否） ")
    private String configType;

    @ApiModelProperty(value = "所属分类的编码")
    private String groupCode;

    @ApiModelProperty(value = "备注")
    private String remark;
}
