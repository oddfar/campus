package com.oddfar.campus.business.core.expander;


import com.oddfar.campus.framework.api.sysconfig.ConfigExpander;

public class CampusConfigExpander {

    /**
     * 获取校园墙文件上传路径
     */
    public static String getCampusFilePath() {
        return ConfigExpander.getFileProfile() + "/CampusFile";
    }

}
