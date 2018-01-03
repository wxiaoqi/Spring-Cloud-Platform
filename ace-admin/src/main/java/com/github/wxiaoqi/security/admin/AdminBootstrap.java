package com.github.wxiaoqi.security.admin;

import com.ace.cache.EnableAceCache;
import com.github.wxiaoqi.security.auth.client.EnableAceAuthClient;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-05-25 12:44
 */
@EnableEurekaClient
@EnableCircuitBreaker
@SpringBootApplication
@EnableFeignClients({"com.github.wxiaoqi.security.auth.client.feign"})
@EnableScheduling
@EnableAceAuthClient
@ServletComponentScan("com.github.wxiaoqi.security.admin.config.druid")
@EnableAceCache
@EnableTransactionManagement
public class AdminBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(AdminBootstrap.class).web(true).run(args);    }
}
