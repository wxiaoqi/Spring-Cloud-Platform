package com.github.wxiaoqi.security.auth.configuration;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * @author ace
 * @create 2017/12/17.
 */
@Configuration
@Data
public class KeyConfiguration {
    @Value("${jwt.rsa-secret}")
    private String userSecret;
    @Value("${client.rsa-secret}")
    private String serviceSecret;
    private byte[] userPubKey;
    private byte[] userPriKey;
    private byte[] servicePriKey;
    private byte[] servicePubKey;
}
