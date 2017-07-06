package com.github.wxiaoqi.security.api.agent.feign;

/**
 * Created by ace on 2017/7/5.
 */
public class AuthenticationServerErrorException extends RuntimeException {
    public AuthenticationServerErrorException(String message) {
        super(message);
    }
}
