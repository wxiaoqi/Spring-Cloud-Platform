package com.github.wxiaoqi.security.api.agent.exception;

/**
 * Created by ace on 2017/7/5.
 */
public class AuthenticationVerifyFailException extends RuntimeException {
    public AuthenticationVerifyFailException(String message) {
        super(message);
    }
}
