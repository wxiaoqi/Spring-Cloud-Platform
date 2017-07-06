package com.github.wxiaoqi.security.admin.security;

import com.github.wxiaoqi.security.admin.rpc.GateService;
import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.gate.ClientInfo;
import com.github.wxiaoqi.security.common.constant.UserConstant;
import com.google.common.base.Predicate;
import com.google.common.collect.Collections2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Created by ace on 2017/7/6.
 */
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private GateService gateService;
    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        ApiSecurity methodAnnotation = handlerMethod.getMethodAnnotation(ApiSecurity.class);
        if(methodAnnotation!=null) {
            String clientId = request.getHeader("clientId");
            String secret = request.getHeader("secret");
            ClientInfo clientInfo = gateService.getGateClientInfo(clientId);
            if (clientInfo != null && encoder.matches(secret,clientInfo.getSecret())) {
                final String requestUri = request.getRequestURI();
                final String method = request.getMethod();
                List<PermissionInfo> clientPermissionInfo = gateService.getGateServiceInfo(clientId);
                Collection<PermissionInfo> result = Collections2.filter(clientPermissionInfo, new Predicate<PermissionInfo>() {
                    @Override
                    public boolean apply(PermissionInfo permissionInfo) {
                        String url = permissionInfo.getUri();
                        String uri = url.replaceAll("\\{\\*\\}", "[a-zA-Z\\\\d]+");
                        String regEx = "^" + uri + "$";
                        return (Pattern.compile(regEx).matcher(requestUri).find() || requestUri.startsWith(url + "/"))
                                && method.equals(permissionInfo.getMethod());
                    }
                });
                if (result.size() <= 0) {
                    return false;
                }
            } else {
                return false;
            }
        }
        return super.preHandle(request, response, handler);
    }
}
