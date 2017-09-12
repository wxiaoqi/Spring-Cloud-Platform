package com.github.wxiaoqi.security.gate.config;

import com.github.wxiaoqi.security.gate.interceptor.ClientTokenInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by ace on 2017/9/12.
 */
//@Configuration
public class ZuulConfig {
    @Bean
    ClientTokenInterceptor getClientTokenInterceptor(){
        return new ClientTokenInterceptor();
    }
}
