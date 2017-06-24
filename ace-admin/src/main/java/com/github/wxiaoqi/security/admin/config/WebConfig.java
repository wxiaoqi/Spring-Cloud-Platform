package com.github.wxiaoqi.security.admin.config;

import com.github.wxiaoqi.security.admin.interceptor.SessionAccessInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(accessInterceptor());
        super.addInterceptors(registry);
    }

    @Bean
    public SessionAccessInterceptor accessInterceptor(){
        return new SessionAccessInterceptor() ;
    }


}
