package com.github.wxiaoqi.security.api.agent.rest;

import com.alibaba.fastjson.JSON;
import com.github.wxiaoqi.security.api.agent.exception.AuthenticationServerErrorException;
import com.github.wxiaoqi.security.api.agent.exception.AuthenticationVerifyFailException;
import jodd.http.HttpRequest;
import jodd.http.HttpResponse;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * api权限拦截器
 * Created by ace on 2017/7/6.
 */
public class ApiInterceptor extends HandlerInterceptorAdapter {
    private String authHost;
    private String tokenHead;

    /**
     * @param tokenHead 认证信息，默认access-token
     */
    public ApiInterceptor(String authHost,String tokenHead) {
        this.authHost = authHost;
        this.tokenHead = tokenHead;
    }

    /**
     * 默认access-token
     *
     */
    public ApiInterceptor(String authHost) {
        this.authHost = authHost;
        this.tokenHead = "access-token";
    }

    @Override
    public boolean preHandle(HttpServletRequest httpRequest, HttpServletResponse httpResponse, Object handler) throws Exception {
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        ApiGateSecurity methodAnnotation = handlerMethod.getMethodAnnotation(ApiGateSecurity.class);
        String token = httpRequest.getHeader(tokenHead);
        if (methodAnnotation != null) {
            HttpResponse response = HttpRequest.get(authHost + "/verify").query("token", token).query("resource", httpRequest.getRequestURI()+":"+httpRequest.getMethod())
                    .send();
            if (response.statusCode() == 200) {
                return super.preHandle(httpRequest, httpResponse, handler);
            } else if (response.statusCode() == 401) {
                httpResponse.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
                return false;
            } else {
                throw new AuthenticationServerErrorException(JSON.toJSONString(response));
            }
        }
        return super.preHandle(httpRequest, httpResponse, handler);
    }
}
