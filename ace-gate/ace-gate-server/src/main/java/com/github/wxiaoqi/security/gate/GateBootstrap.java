package com.github.wxiaoqi.security.gate;


import com.github.wxiaoqi.gate.ratelimit.EnableAceGateRateLimit;
import com.github.wxiaoqi.gate.ratelimit.config.IUserPrincipal;
import com.github.wxiaoqi.security.auth.client.EnableAceAuthClient;
import com.github.wxiaoqi.security.gate.config.UserPrincipal;
import com.github.wxiaoqi.security.gate.utils.DBLog;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * Created by Ace on 2017/6/2.
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients({"com.github.wxiaoqi.security.auth.client.feign","com.github.wxiaoqi.security.gate.feign"})
@EnableZuulProxy
@EnableScheduling
@EnableAceAuthClient
@EnableAceGateRateLimit
public class GateBootstrap {
    public static void main(String[] args) {
        DBLog.getInstance().start();
        SpringApplication.run(GateBootstrap.class, args);
    }

    @Bean
    @Primary
    IUserPrincipal userPrincipal(){
        return new UserPrincipal();
    }
}
