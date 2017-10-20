package com.github.wxiaoqi.security.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.sidecar.EnableSidecar;
/**
 * Created by ace on 2017/7/29.
 */
@EnableSidecar
@SpringBootApplication
public class PythonServerBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(PythonServerBootstrap.class, args);
    }
}
