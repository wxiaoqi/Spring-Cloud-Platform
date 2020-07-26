package com.github.wxiaoqi.security.modules.auth.util.user;

import java.io.Serializable;

public class JwtAuthenticationRequest implements Serializable {

    private static final long serialVersionUID = -8445943548965154778L;

    private String username;
    private String password;
    private String verCode;
    private String uuid;

    public JwtAuthenticationRequest(String username, String password, String verCode, String uuid) {
        this.username = username;
        this.password = password;
        this.verCode = verCode;
        this.uuid = uuid;
    }

    public JwtAuthenticationRequest() {
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getVerCode() {
        return verCode;
    }

    public void setVerCode(String verCode) {
        this.verCode = verCode;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
