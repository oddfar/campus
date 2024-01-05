package com.oddfar.campus.framework.service.impl;

import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.oddfar.campus.common.constant.Constants;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.domain.entity.SysLoginLogEntity;
import com.oddfar.campus.common.domain.event.LogininforEvent;
import com.oddfar.campus.common.utils.LogUtils;
import com.oddfar.campus.common.utils.SpringUtils;
import com.oddfar.campus.common.utils.StringUtils;
import com.oddfar.campus.common.utils.ip.AddressUtils;
import com.oddfar.campus.common.utils.ip.IpUtils;
import com.oddfar.campus.framework.mapper.SysLoginLogMapper;
import com.oddfar.campus.framework.service.SysLoginLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 系统访问日志情况信息 服务层处理
 *
 * @author ruoyi
 */
@Service
@Slf4j
public class SysLoginLogServiceImpl implements SysLoginLogService {

    @Resource
    private SysLoginLogMapper loginLogMapper;

    /**
     * 记录登录信息
     *
     * @param logininforEvent 登录事件
     */
    @Async
    @EventListener
    public void recordLogininfor(LogininforEvent logininforEvent) {
        HttpServletRequest request = logininforEvent.getRequest();
        final UserAgent userAgent = UserAgentUtil.parse(request.getHeader("User-Agent"));
        final String ip = IpUtils.getIpAddr(request);

        String address = AddressUtils.getRealAddressByIP(ip);
        StringBuilder s = new StringBuilder();
        s.append(LogUtils.getBlock(ip));
        s.append(address);
        s.append(LogUtils.getBlock(logininforEvent.getUsername()));
        s.append(LogUtils.getBlock(logininforEvent.getUserId()));
        s.append(LogUtils.getBlock(logininforEvent.getStatus()));
        s.append(LogUtils.getBlock(logininforEvent.getMessage()));
        // 打印信息到日志
        log.info(s.toString(), logininforEvent.getArgs());
        // 获取客户端操作系统
        String os = userAgent.getOs().getName();
        // 获取客户端浏览器
        String browser = userAgent.getBrowser().getName();
        // 封装对象
        SysLoginLogEntity logininfor = new SysLoginLogEntity();
        logininfor.setLoginTime(new Date());
        logininfor.setUserName(logininforEvent.getUsername());
        logininfor.setUserId(logininforEvent.getUserId());
        logininfor.setIpaddr(ip);
        logininfor.setLoginLocation(address);
        logininfor.setBrowser(browser);
        logininfor.setOs(os);
        logininfor.setMsg(logininforEvent.getMessage());
        // 日志状态
        if (StringUtils.equalsAny(logininforEvent.getStatus(), Constants.LOGIN_SUCCESS, Constants.LOGOUT, Constants.REGISTER)) {
            logininfor.setStatus(Constants.SUCCESS);
        } else if (Constants.LOGIN_FAIL.equals(logininforEvent.getStatus())) {
            logininfor.setStatus(Constants.FAIL);
        }
        // 插入数据
        SpringUtils.getBean(SysLoginLogService.class).insertLogininfor(logininfor);

    }

    /**
     * 查询系统登录日志分页数据
     *
     * @param logininfor 访问日志对象
     * @return 登录记录分页数据
     */
    @Override
    public PageResult<SysLoginLogEntity> selectLogininforPage(SysLoginLogEntity logininfor) {
        return loginLogMapper.selectLogininforPage(logininfor);
    }

    /**
     * 新增系统登录日志
     *
     * @param logininfor 访问日志对象
     */
    @Override
    public void insertLogininfor(SysLoginLogEntity logininfor) {
        loginLogMapper.insert(logininfor);
    }

    /**
     * 查询系统登录日志集合
     *
     * @param logininfor 访问日志对象
     * @return 登录记录集合
     */
    @Override
    public List<SysLoginLogEntity> selectLogininforList(SysLoginLogEntity logininfor) {
        return loginLogMapper.selectLogininforList(logininfor);
    }

    /**
     * 批量删除系统登录日志
     *
     * @param infoIds 需要删除的登录日志ID
     * @return 结果
     */
    @Override
    public int deleteLogininforByIds(Long[] infoIds) {
        return loginLogMapper.deleteBatchIds(Arrays.asList(infoIds));
    }

    /**
     * 清空系统登录日志
     */
    @Override
    public void cleanLogininfor() {
        loginLogMapper.cleanLogininfor();
    }
}
