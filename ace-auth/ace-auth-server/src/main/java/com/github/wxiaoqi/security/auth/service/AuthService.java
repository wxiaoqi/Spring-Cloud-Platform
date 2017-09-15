package com.github.wxiaoqi.security.auth.service;


import com.github.wxiaoqi.security.auth.vo.FrontUser;

public interface AuthService {
    String login(String username, String password) throws Exception;
    String refresh(String oldToken);
    void validate(String token) throws Exception;
    FrontUser getUserInfo(String token) throws Exception;
    Boolean invalid(String token);
}
