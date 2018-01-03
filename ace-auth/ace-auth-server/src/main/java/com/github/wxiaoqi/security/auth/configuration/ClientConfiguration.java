package com.github.wxiaoqi.security.auth.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * Created by ace on 2017/9/12.
 */
@Configuration
public class ClientConfiguration {
    @Value("${client.id}")
    private String clientId;
    @Value("${client.secret}")
    private String clientSecret;
    @Value("${client.token-header}")
    private String clientTokenHeader;

    public String getClientTokenHeader() {
        return clientTokenHeader;
    }

    public String getClientSecret() {
        return clientSecret;
    }

    public String getClientId() {
        return clientId;
    }


}
