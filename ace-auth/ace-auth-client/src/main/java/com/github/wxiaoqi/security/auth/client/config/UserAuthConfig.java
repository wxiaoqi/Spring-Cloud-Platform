package com.github.wxiaoqi.security.auth.client.config;

import org.springframework.beans.factory.annotation.Value;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ace on 2017/9/15.
 */
public class UserAuthConfig {
    @Value("${auth.user.pub-key.path}")
    private String pubKeyPath;
    @Value("${auth.user.token-header}")
    private String tokenHeader;

    public String getTokenHeader() {
        return tokenHeader;
    }

    public void setTokenHeader(String tokenHeader) {
        this.tokenHeader = tokenHeader;
    }

    public String getPubKeyPath() {
        return pubKeyPath;
    }

    public void setPubKeyPath(String pubKeyPath) {
        this.pubKeyPath = pubKeyPath;
    }

    public String getToken(HttpServletRequest request){
        return request.getHeader(this.getTokenHeader());
    }


}
