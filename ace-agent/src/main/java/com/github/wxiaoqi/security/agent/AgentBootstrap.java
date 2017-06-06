package com.github.wxiaoqi.security.agent;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

/**
 * Created by Ace on 2017/5/27.
 */
//@EnableDiscoveryClient  //激活eureka中的DiscoveryClient实现
@SpringBootApplication
@EnableFeignClients
@EnableZuulProxy
public class AgentBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(AgentBootstrap.class).web(true).run(args);    }
}
