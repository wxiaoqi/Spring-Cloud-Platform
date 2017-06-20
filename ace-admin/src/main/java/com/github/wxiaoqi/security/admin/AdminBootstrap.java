package com.github.wxiaoqi.security.admin;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-05-25 12:44
 */
//@EnableDiscoveryClient  //激活eureka中的DiscoveryClient实现
@EnableEurekaClient
@EnableHystrix
@SpringBootApplication
@ServletComponentScan
public class AdminBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(AdminBootstrap.class).web(true).run(args);    }
}
