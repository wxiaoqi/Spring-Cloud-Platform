package com.github.wxiaoqi.security.demo.mybatis;

import com.github.wxiaoqi.security.auth.client.EnableAceAuthClient;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author ace
 * @create 2017/12/26.
 */
@EnableEurekaClient
@SpringBootApplication
// 开启druid监控
@ServletComponentScan("com.github.wxiaoqi.security.demo.mybatis.config.druid")
// 开启事务
@EnableTransactionManagement
// 开启熔断监控
@EnableCircuitBreaker
// 开启服务鉴权
@EnableFeignClients({"com.github.wxiaoqi.security.auth.client.feign"})
@EnableAceAuthClient
public class DemoMybatisBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(DemoMybatisBootstrap.class).web(true).run(args);    }
}
