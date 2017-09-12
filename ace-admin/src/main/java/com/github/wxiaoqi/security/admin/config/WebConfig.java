package com.github.wxiaoqi.security.admin.config;

import com.github.wxiaoqi.security.admin.interceptor.ClientInterceptor;
import com.github.wxiaoqi.security.admin.interceptor.JWTInterceptor;
import com.github.wxiaoqi.security.common.handler.GlobalExceptionHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by ace on 2017/9/8.
 */
@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {
    @Bean
    GlobalExceptionHandler getGlobalExceptionHandler(){
        return new GlobalExceptionHandler();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(getClientInterceptor()).addPathPatterns("/**");
        registry.addInterceptor(getJWTInterceptor()).addPathPatterns("/**").excludePathPatterns("/api/user/username/**");
        super.addInterceptors(registry);
    }

    @Bean
    JWTInterceptor getJWTInterceptor(){
        return new JWTInterceptor();
    }

    @Bean
    ClientInterceptor getClientInterceptor(){
        return new ClientInterceptor();
    }
}
