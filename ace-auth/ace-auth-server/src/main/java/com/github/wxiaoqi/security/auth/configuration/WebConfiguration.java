package com.github.wxiaoqi.security.auth.configuration;

import com.github.wxiaoqi.security.auth.interceptor.ServiceAuthRestInterceptor;
import com.github.wxiaoqi.security.auth.interceptor.UserAuthRestInterceptor;
import com.github.wxiaoqi.security.common.handler.GlobalExceptionHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.util.ArrayList;
import java.util.Collections;

/**
 * Created by ace on 2017/9/8.
 */
@Configuration("admimWebConfig")
@Primary
public class WebConfiguration extends WebMvcConfigurerAdapter {
    @Bean
    GlobalExceptionHandler getGlobalExceptionHandler() {
        return new GlobalExceptionHandler();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        ArrayList<String> commonPathPatterns = getExcludeCommonPathPatterns();
        registry.addInterceptor(getServiceAuthRestInterceptor()).addPathPatterns("/**").excludePathPatterns(commonPathPatterns.toArray(new String[]{}));
        registry.addInterceptor(getUserAuthRestInterceptor()).addPathPatterns("/**").excludePathPatterns(commonPathPatterns.toArray(new String[]{}));
        super.addInterceptors(registry);
    }

    @Bean
    ServiceAuthRestInterceptor getServiceAuthRestInterceptor() {
        return new ServiceAuthRestInterceptor();
    }

    @Bean
    UserAuthRestInterceptor getUserAuthRestInterceptor() {
        return new UserAuthRestInterceptor();
    }


    private ArrayList<String> getExcludeCommonPathPatterns() {
        ArrayList<String> list = new ArrayList<>();
        String[] urls = {
                "/v2/api-docs",
                "/swagger-resources/**",
                "/client/**",
                "/jwt/**"
        };
        Collections.addAll(list, urls);
        return list;
    }
}
