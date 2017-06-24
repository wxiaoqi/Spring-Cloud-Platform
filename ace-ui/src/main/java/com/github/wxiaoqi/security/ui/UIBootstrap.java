package com.github.wxiaoqi.security.ui;


import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

/**
 * Created by Ace on 2017/5/27.
 */
@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
public class UIBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(UIBootstrap.class).web(true).run(args);    }
}
