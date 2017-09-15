package com.github.wxiaoqi.security.auth.util.client;

import com.github.wxiaoqi.security.common.util.jwt.IJWTInfo;
import com.github.wxiaoqi.security.common.util.jwt.JWTHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * Created by ace on 2017/9/10.
 */
@Configuration
public class ClientTokenUtil {
    private Logger logger = LoggerFactory.getLogger(ClientTokenUtil.class);

    @Value("${client.expire}")
    private int expire;
    @Value("${client.pri-key.path}")
    private String priKeyPath;
    @Value("${client.pub-key.path}")
    private String pubKeyPath;

    public String generateToken(IJWTInfo jwtInfo) throws Exception {
        return JWTHelper.generateToken(jwtInfo,priKeyPath,expire);
    }

    public IJWTInfo getInfoFromToken(String token) throws Exception {
        return JWTHelper.getInfoFromToken(token,pubKeyPath);
    }

}
