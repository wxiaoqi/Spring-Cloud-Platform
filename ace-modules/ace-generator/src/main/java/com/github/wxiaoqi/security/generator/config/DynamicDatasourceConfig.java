package com.github.wxiaoqi.security.generator.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author laogandie
 * @create 2020/1/28.
 */
@Configuration
@AutoConfigureAfter(DataSourceConfigurer.class)
public class DynamicDatasourceConfig {
    @Autowired
    private List<DruidDataSource> source;

    /**
     * spring boot 启动后将自定义创建好的数据源对象放到TargetDataSources中用于后续的切换数据源用
     *             (比如：DynamicDataSourceContextHolder.setDataSourceKey("dbMall")，手动切换到dbMall数据源
     * 同时指定默认数据源连接
     * @return 动态数据源对象
     */
    @Bean
    @Primary
    public DynamicDataSource dynamicDataSource() {
        //获取动态数据库的实例（单例方式）
        DynamicDataSource dynamicDataSource = DynamicDataSource.getInstance();
//        //创建默认数据库连接对象
        DruidDataSource defaultDataSource = source.get(0);

        Map<Object,Object> map = new HashMap<>();
        //自定义数据源key值，将创建好的数据源对象，赋值到targetDataSources中,用于切换数据源时指定对应key即可切换
        for(DruidDataSource dataSource:source) {
            map.put(dataSource.getName(), dataSource);
        }
        dynamicDataSource.setTargetDataSources(map);
        //设置默认数据源
        dynamicDataSource.setDefaultTargetDataSource(defaultDataSource);

        return dynamicDataSource;
    }

    /**
     * 将动态数据源添加到事务管理器中，并生成新的bean
     * @return the platform transaction manager
     */
    @Bean
    public PlatformTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dynamicDataSource());
    }
}
