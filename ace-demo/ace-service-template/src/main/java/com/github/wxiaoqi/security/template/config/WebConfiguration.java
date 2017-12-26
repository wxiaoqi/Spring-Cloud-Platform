package com.github.wxiaoqi.security.template.config;

import com.github.wxiaoqi.security.auth.client.interceptor.ServiceAuthRestInterceptor;
import com.github.wxiaoqi.security.auth.client.interceptor.UserAuthRestInterceptor;
import com.github.wxiaoqi.security.common.handler.GlobalExceptionHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.util.ArrayList;
import java.util.Collections;

/**
 * 拦截器和全局配置
 * @author ace
 * @date 2017/9/8
 */
@Configuration("templateWebConfig")
@Primary
public class WebConfiguration extends WebMvcConfigurerAdapter {
    @Bean
    GlobalExceptionHandler getGlobalExceptionHandler() {
        return new GlobalExceptionHandler();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        ArrayList<String> commonPathPatterns = getExcludeCommonPathPatterns();
        /*
            增加服务权限烂机器
         */
        registry.addInterceptor(getServiceAuthRestInterceptor()).addPathPatterns("/**").excludePathPatterns(commonPathPatterns.toArray(new String[]{}));
        /*
            增加用户权限拦截器
         */
        registry.addInterceptor(getUserAuthRestInterceptor()).addPathPatterns("/**").excludePathPatterns(commonPathPatterns.toArray(new String[]{}));
        super.addInterceptors(registry);
    }

    /**
     * 配置服务权限拦截
     * @return
     */
    @Bean
    ServiceAuthRestInterceptor getServiceAuthRestInterceptor() {
        return new ServiceAuthRestInterceptor();
    }

    /**
     * 配置用户用户token拦截
     * @return
     */
    @Bean
    UserAuthRestInterceptor getUserAuthRestInterceptor() {
        return new UserAuthRestInterceptor();
    }

    /**
     * 配置一些不进行拦截的路劲
     * @return
     */
    private ArrayList<String> getExcludeCommonPathPatterns() {
        ArrayList<String> list = new ArrayList<String>();
        String[] urls = {
                "/v2/api-docs",
                "/swagger-resources/**"
        };
        Collections.addAll(list, urls);
        return list;
    }
}
