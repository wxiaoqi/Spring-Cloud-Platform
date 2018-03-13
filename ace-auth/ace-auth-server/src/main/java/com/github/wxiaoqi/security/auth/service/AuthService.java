package com.github.wxiaoqi.security.auth.service;


import com.github.wxiaoqi.security.auth.util.user.JwtAuthenticationRequest;

public interface AuthService {
    String login(JwtAuthenticationRequest authenticationRequest) throws Exception;
    String refresh(String oldToken);
    void validate(String token) throws Exception;
    Boolean invalid(String token);
}
