package com.github.wxiaoqi.security.trace;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.sleuth.zipkin.stream.EnableZipkinStreamServer;

/**
 * Created by ace on 2017/7/10.
 */
@SpringBootApplication
@EnableEurekaClient
@EnableZipkinStreamServer
public class TraceBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(TraceBootstrap.class,args);
    }
}
