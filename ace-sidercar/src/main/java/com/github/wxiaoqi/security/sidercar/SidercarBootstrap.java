package com.github.wxiaoqi.security.sidercar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.sidecar.EnableSidecar;

/**
 * Created by ace on 2017/7/29.
 */
@EnableSidecar
@SpringBootApplication
public class SidercarBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(SidercarBootstrap.class, args);
    }
}
