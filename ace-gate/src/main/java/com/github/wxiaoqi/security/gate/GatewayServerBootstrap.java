package com.github.wxiaoqi.security.gate;

import com.github.wxiaoqi.security.auth.client.EnableAceAuthClient;
import com.github.wxiaoqi.security.gate.utils.DBLog;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author ace
 * @create 2018/3/12.
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableAceAuthClient
//TODO 切换为webclient
@EnableFeignClients({"com.github.wxiaoqi.security.auth.client.feign"})
public class GatewayServerBootstrap {
    public static void main(String[] args) {
        DBLog.getInstance().start();
        SpringApplication.run(GatewayServerBootstrap.class, args);
    }
}
