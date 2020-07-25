package com.github.wxiaoqi.security.generator.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 数据源配置类,在tomcat启动时触发，在该类中生成多个数据源实例并将其注入到 ApplicationContext 中
 * @author lxf 2018-09-27
 */

@Configuration
public class DataSourceConfigurer {

    @Bean("Sample数据库")
    @ConfigurationProperties(prefix = "spring.sample-datasource")
    public DruidDataSource sampleDatasource() {
        return DataSourceBuilder.create().type(DruidDataSource.class).build();
    }


    @Bean("Admin数据库")
    @ConfigurationProperties(prefix = "spring.datasource")
    public DruidDataSource adminDatasource() {
        return DataSourceBuilder.create().type(DruidDataSource.class).build();
    }

}