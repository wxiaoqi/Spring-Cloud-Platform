package com.github.wxiaoqi.security.ui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Base64Utils;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ace on 2017/7/25.
 */
public class BaseController {
    @Autowired
    private HttpServletRequest request;
    public String getCurrentUserName(){
        String authorization = request.getHeader("Authorization");
        return new String(Base64Utils.decodeFromString(authorization));
    }
}
