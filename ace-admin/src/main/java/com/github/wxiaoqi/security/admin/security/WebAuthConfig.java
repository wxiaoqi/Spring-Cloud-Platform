package com.github.wxiaoqi.security.admin.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by ace on 2017/7/6.
 */
@Configuration
public class WebAuthConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authenticationInterceptor()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }
    @Bean
    public AuthenticationInterceptor authenticationInterceptor (){
        return new AuthenticationInterceptor();
    }
}
