package com.github.wxiaoqi.security.gate.config;

import com.github.wxiaoqi.security.auth.client.interceptor.ServiceFeignInterceptor;
import org.springframework.context.annotation.Bean;

/**
 * Created by ace on 2017/9/12.
 */
//@Configuration
public class ZuulConfig {
    @Bean
    ServiceFeignInterceptor getClientTokenInterceptor(){
        return new ServiceFeignInterceptor();
    }
}
