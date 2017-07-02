package com.github.wxiaoqi.security.api.gate.auth;


public interface AuthService {
    String login(String username, String password);
    String refresh(String oldToken);
}
