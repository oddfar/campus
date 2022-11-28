package com.oddfar.campus.common.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@ApiModel("分页结果")
@Data
public final class PageResult<T> implements Serializable {

    @ApiModelProperty(value = "数据", required = true)
    private List<T> rows;

    @ApiModelProperty(value = "总量", required = true)

    private int total;

    public PageResult() {
    }

    public PageResult(List<T> rows, int total) {
        this.rows = rows;
        this.total = total;
    }

    public PageResult(int total) {
        this.rows = new ArrayList<>();
        this.total = total;
    }

    public static <T> PageResult<T> empty() {
        return new PageResult<>(0);
    }

    public static <T> PageResult<T> empty(int total) {
        return new PageResult<>(total);
    }


}
