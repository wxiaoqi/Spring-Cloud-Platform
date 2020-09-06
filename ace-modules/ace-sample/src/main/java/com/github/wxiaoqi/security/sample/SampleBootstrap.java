package com.github.wxiaoqi.security.sample;

import com.github.wxiaoqi.security.auth.client.EnableAceAuthClient;
import com.spring4all.swagger.EnableSwagger2Doc;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author laogandie
 * @create 2020/9/5.
 */
@EnableDiscoveryClient
@EnableCircuitBreaker
@SpringBootApplication
@EnableTransactionManagement
@MapperScan("com.github.wxiaoqi.security.sample.mapper")
@EnableSwagger2Doc
@EnableAceAuthClient
@EnableFeignClients({"com.github.wxiaoqi.security.auth.client.feign"})
public class SampleBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(SampleBootstrap.class).run(args);    }
}
