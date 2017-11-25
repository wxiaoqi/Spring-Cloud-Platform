package com.github.wxiaoqi.security.auth.client.interceptor;

import com.github.wxiaoqi.security.auth.client.config.ServiceAuthConfig;
import com.github.wxiaoqi.security.auth.client.config.UserAuthConfig;
import com.github.wxiaoqi.security.auth.client.jwt.ServiceAuthUtil;
import com.github.wxiaoqi.security.common.context.BaseContextHandler;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author ace
 * @date 2017/9/15
 */
public class ServiceFeignInterceptor implements RequestInterceptor {
    private Logger logger = LoggerFactory.getLogger(ServiceFeignInterceptor.class);
    @Autowired
    private ServiceAuthConfig serviceAuthConfig;
    @Autowired
    private UserAuthConfig userAuthConfig;
    @Autowired
    private ServiceAuthUtil serviceAuthUtil;

    public ServiceFeignInterceptor() {
    }


    @Override
    public void apply(RequestTemplate requestTemplate) {
        requestTemplate.header(serviceAuthConfig.getTokenHeader(), serviceAuthUtil.getClientToken());
        requestTemplate.header(userAuthConfig.getTokenHeader(), BaseContextHandler.getToken());
    }

    public void setServiceAuthConfig(ServiceAuthConfig serviceAuthConfig) {
        this.serviceAuthConfig = serviceAuthConfig;
    }

    public void setUserAuthConfig(UserAuthConfig userAuthConfig) {
        this.userAuthConfig = userAuthConfig;
    }

    public void setServiceAuthUtil(ServiceAuthUtil serviceAuthUtil) {
        this.serviceAuthUtil = serviceAuthUtil;
    }
}