package com.github.wxiaoqi.security.auth.util.client;

import com.github.wxiaoqi.security.auth.common.util.jwt.IJWTInfo;
import com.github.wxiaoqi.security.auth.common.util.jwt.JWTHelper;
import com.github.wxiaoqi.security.auth.configuration.KeyConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private KeyConfig keyConfig;

    public String generateToken(IJWTInfo jwtInfo) throws Exception {
        return JWTHelper.generateToken(jwtInfo, keyConfig.getServicePriKey(), expire);
    }

    public IJWTInfo getInfoFromToken(String token) throws Exception {
        return JWTHelper.getInfoFromToken(token, keyConfig.getServicePubKey());
    }

}
