package com.github.wxiaoqi.security.api.gate.auth;


public interface AuthService {
    String login(String clientId, String secret);
    String refresh(String oldToken);
    Boolean validate(String token,String resource);
}
