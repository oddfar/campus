package com.oddfar.campus.framework.api.file;


import com.oddfar.campus.framework.expander.SysConfigExpander;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 文件的自动配置
 */
@Configuration
public class FileAutoConfiguration {

    /**
     * 本地文件操作
     */
    @Bean
    @ConditionalOnMissingBean(FileOperatorApi.class)
    public FileOperatorApi fileOperatorApi() {
        return new LocalFileOperator(SysConfigExpander.getFileProfile());
    }

}
