package com.github.wxiaoqi.security.gate.service;


public interface AuthService {
    String login(String clientId, String secret);
    String refresh(String oldToken);
    Boolean validate(String token, String resource);
}
