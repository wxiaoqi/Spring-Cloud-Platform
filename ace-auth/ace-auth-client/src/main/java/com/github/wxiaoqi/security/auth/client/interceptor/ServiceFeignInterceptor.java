package com.github.wxiaoqi.security.auth.client.interceptor;

import com.github.wxiaoqi.security.auth.client.config.ServiceAuthConfig;
import com.github.wxiaoqi.security.auth.client.config.UserAuthConfig;
import com.github.wxiaoqi.security.auth.client.feign.ServiceAuthFeign;
import com.github.wxiaoqi.security.auth.client.jwt.ServiceAuthUtil;
import com.github.wxiaoqi.security.common.context.BaseContextHandler;
import com.github.wxiaoqi.security.common.msg.BaseResponse;
import com.github.wxiaoqi.security.common.msg.ObjectRestResponse;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

/**
 * Created by ace on 2017/9/15.
 */
public class ServiceFeignInterceptor implements RequestInterceptor {
    private Logger logger = LoggerFactory.getLogger(ServiceFeignInterceptor.class);
    @Autowired
    private ServiceAuthConfig serviceAuthConfig;
    @Autowired
    private UserAuthConfig userAuthConfig;
    @Autowired
    private ServiceAuthFeign serviceAuthFeign;
    @Autowired
    private ServiceAuthUtil serviceAuthUtil;

    private String clientToken;

    @Override
    public void apply(RequestTemplate requestTemplate) {
        if(this.clientToken == null)
            this.refresh();
        requestTemplate.header(serviceAuthConfig.getTokenHeader(), this.clientToken);
        requestTemplate.header(userAuthConfig.getTokenHeader(), BaseContextHandler.getToken());
    }

    @Scheduled(cron = "0 0/5 * * * ?")
    public void refresh(){
        try{
            logger.info("refresh client token.....");
            serviceAuthUtil.getInfoFromToken(this.clientToken);
        }catch (Exception e){
            BaseResponse resp = serviceAuthFeign.getAccessToken(serviceAuthConfig.getClientId(), serviceAuthConfig.getClientSecret());
            if (resp.getStatus() == 200) {
                ObjectRestResponse<String> clientToken = (ObjectRestResponse<String>) resp;
                this.clientToken = clientToken.getData();
            }
        }
    }
}