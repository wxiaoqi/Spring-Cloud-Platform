package com.github.wxiaoqi.security.gate.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * Created by ace on 2017/9/12.
 */
@Configuration
public class JwtConfig {
    public String getTokenHeader() {
        return tokenHeader;
    }

    @Value("${jwt.token-header}")
    private String tokenHeader;
}
