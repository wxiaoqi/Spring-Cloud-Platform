package com.github.wxiaoqi.security.auth.service;


public interface AuthService {
    String login(String username, String password) throws Exception;
    String refresh(String oldToken);
    void validate(String token) throws Exception;
<<<<<<< HEAD
//    FrontUser getUserInfo(String token) throws Exception;
=======
>>>>>>> v2.2-SNAPSHOT
    Boolean invalid(String token);
}
