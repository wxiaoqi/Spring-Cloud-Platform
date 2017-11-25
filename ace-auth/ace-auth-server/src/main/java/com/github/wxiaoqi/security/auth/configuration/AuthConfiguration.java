package com.github.wxiaoqi.security.auth.configuration;

import com.github.wxiaoqi.security.auth.common.util.jwt.RsaKeyHelper;
import com.github.wxiaoqi.security.common.handler.GlobalExceptionHandler;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

/**
 * Created by ace on 2017/9/10.
 */
@Configuration
public class AuthConfiguration {


    @Bean
    public GlobalExceptionHandler getGlobalExceptionHandler(){
        return new GlobalExceptionHandler();
    }

}
