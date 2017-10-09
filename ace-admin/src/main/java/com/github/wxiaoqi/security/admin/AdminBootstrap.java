package com.github.wxiaoqi.security.admin;

import com.github.wxiaoqi.security.auth.client.EnableAceAuthClient;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-05-25 12:44
 */
//@EnableDiscoveryClient  //激活eureka中的DiscoveryClient实现
@EnableEurekaClient
@EnableCircuitBreaker
@SpringBootApplication
@EnableFeignClients({"com.github.wxiaoqi.security.auth.client.feign"})
@EnableScheduling
@EnableAceAuthClient
@ServletComponentScan("com.github.wxiaoqi.security.admin.config.druid")
public class AdminBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(AdminBootstrap.class).web(true).run(args);    }
}
