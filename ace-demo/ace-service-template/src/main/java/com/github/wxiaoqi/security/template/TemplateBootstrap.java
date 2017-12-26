package com.github.wxiaoqi.security.template;

import com.github.wxiaoqi.security.auth.client.EnableAceAuthClient;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;

/**
 * @author ace
 * @create 2017/12/26.
 */
@EnableEurekaClient
@SpringBootApplication
// 开启服务鉴权
@EnableFeignClients({"com.github.wxiaoqi.security.auth.client.feign"})
@EnableAceAuthClient
public class TemplateBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(TemplateBootstrap.class).web(true).run(args);    }
}
