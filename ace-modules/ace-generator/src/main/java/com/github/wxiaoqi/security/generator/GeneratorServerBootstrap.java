package com.github.wxiaoqi.security.generator;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author ace
 * @create 2018/3/12.
 */
@SpringCloudApplication
@ComponentScan({"com.github.wxiaoqi.security.common","com.github.wxiaoqi.security.generator"})
@MapperScan("com.github.wxiaoqi.security.generator.mapper")
public class GeneratorServerBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(GeneratorServerBootstrap.class, args);
    }
}
