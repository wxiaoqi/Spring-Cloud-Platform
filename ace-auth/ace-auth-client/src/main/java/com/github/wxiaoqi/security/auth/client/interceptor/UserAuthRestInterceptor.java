package com.github.wxiaoqi.security.auth.client.interceptor;

import com.github.wxiaoqi.security.auth.client.config.UserAuthConfig;
import com.github.wxiaoqi.security.auth.client.jwt.UserAuthUtil;
import com.github.wxiaoqi.security.common.context.BaseContextHandler;
import com.github.wxiaoqi.security.common.util.jwt.IJWTInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ace on 2017/9/10.
 */
public class UserAuthRestInterceptor extends HandlerInterceptorAdapter {
    private Logger logger = LoggerFactory.getLogger(UserAuthRestInterceptor.class);

    @Autowired
    private UserAuthUtil userAuthUtil;

    @Autowired
    private UserAuthConfig userAuthConfig;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader(userAuthConfig.getTokenHeader());
        IJWTInfo infoFromToken = userAuthUtil.getInfoFromToken(token);
        BaseContextHandler.setUsername(infoFromToken.getUniqueName());
        BaseContextHandler.setName(infoFromToken.getName());
        BaseContextHandler.setUserID(infoFromToken.getId());
        return super.preHandle(request, response, handler);
    }
}
