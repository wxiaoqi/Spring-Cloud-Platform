package com.github.wxiaoqi.security.auth;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.bus.jackson.RemoteApplicationEventScan;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;

/**
 * Created by Ace on 2017/6/2.
 */
@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
@MapperScan("com.github.wxiaoqi.security.auth.mapper")
@RemoteApplicationEventScan(basePackages = "com.github.wxiaoqi.security.auth.common.event")
@EnableAutoConfiguration
public class AuthBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(AuthBootstrap.class, args);
    }
}
