package com.github.wxiaoqi.security.generator;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author Mr.AG
 * @email 463540703@qq.com
 * @date 2017年08月25日
 */
@SpringBootApplication
@MapperScan("com.github.wxiaoqi.security.generator.mapper")
public class GeneratorBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(GeneratorBootstrap.class, args);
    }
}
