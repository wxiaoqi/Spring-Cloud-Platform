package com.github.wxiaoqi.security.generator.config;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

/**
 * 切换数据库类
 *
 * @author lxf 2018-09-28
 */
@Configuration
@Slf4j
public class SwitchDB {
    @Autowired
    private Environment evn;
    //私有库数据源key
    private static String ljyunDataSourceKey = "ljyun_";

    @Autowired
    DynamicDataSource dynamicDataSource;

    /**
     * 切换数据库对外方法,如果私有库id参数非0,则首先连接私有库，否则连接其他已存在的数据源
     *
     * @param dbName 已存在的数据库源对象
     * @return 返回当前数据库连接对象对应的key
     */
    public String change(String dbName) {
        toDB(dbName);
        //获取当前连接的数据源对象的key
        String currentKey = DynamicDataSourceContextHolder.getDataSourceKey();
        log.info("＝＝＝＝＝当前连接的数据库是:" + currentKey);
        return currentKey;
    }

    /**
     * 切换已存在的数据源
     *
     * @param dbName
     */
    private void toDB(String dbName) {
        //如果不指定数据库，则直接连接默认数据库
        String dbSourceKey = dbName.trim().isEmpty() ? "default" : dbName.trim();
        //获取当前连接的数据源对象的key
        String currentKey = DynamicDataSourceContextHolder.getDataSourceKey();
        //如果当前数据库连接已经是想要的连接，则直接返回
        if (currentKey == dbSourceKey) {
            return;
        }
        //判断储存动态数据源实例的map中key值是否存在
        if (DynamicDataSource.isExistDataSource(dbSourceKey)) {
            DynamicDataSourceContextHolder.setDataSourceKey(dbSourceKey);
            log.info("＝＝＝＝＝普通库: " + dbName + ",切换完毕");
        } else {
            log.info("切换普通数据库时，数据源key=" + dbName + "不存在");
        }
    }

}
