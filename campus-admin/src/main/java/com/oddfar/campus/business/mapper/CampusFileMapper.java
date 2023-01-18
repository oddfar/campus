package com.oddfar.campus.business.mapper;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateUtil;
import com.oddfar.campus.business.domain.entity.CampusFileEntity;
import com.oddfar.campus.business.domain.vo.CampusFileVo;
import com.oddfar.campus.common.core.BaseMapperX;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @author ningzhiyuan
 */
@Mapper
public interface CampusFileMapper extends BaseMapperX<CampusFileEntity> {

    CampusFileVo getContentFile(@Param("contentId") Long contentId);

    /**
     * 获取用户当日上传文件的数量
     * @param userId
     * @return
     */
    default long getFileCountDay(Long userId) {

        Date start = Convert.toDate(DateUtil.today() + " 00:00:00");
        Date end = Convert.toDate(DateUtil.today()  + " 23:59:59");

        return selectCount(new LambdaQueryWrapperX<CampusFileEntity>()
                .eq(CampusFileEntity::getUserId, userId)
                .betweenIfPresent(CampusFileEntity::getCreateTime, start, end)
        );
    }

    int updateContentFile(@Param("fileIds") List<Long> fileIds, @Param("contentId") Long contentId);
}




