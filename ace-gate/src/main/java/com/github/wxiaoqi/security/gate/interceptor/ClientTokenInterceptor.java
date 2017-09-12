package com.github.wxiaoqi.security.gate.interceptor;

import com.alibaba.fastjson.JSON;
import com.github.wxiaoqi.security.common.constant.CommonConstants;
import com.github.wxiaoqi.security.common.context.BaseContextHandler;
import com.github.wxiaoqi.security.common.msg.BaseResponse;
import com.github.wxiaoqi.security.common.msg.ObjectRestResponse;
import com.github.wxiaoqi.security.gate.config.ClientConfig;
import com.github.wxiaoqi.security.gate.config.JwtConfig;
import com.github.wxiaoqi.security.gate.feign.ClientAuthFeign;
import com.github.wxiaoqi.security.gate.utils.ClientTokenUtil;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Scheduled;

/**
 * Created by ace on 2017/9/12.
 */
public class ClientTokenInterceptor implements RequestInterceptor {
    private Logger logger = LoggerFactory.getLogger(ClientTokenInterceptor.class);
    @Autowired
    private ClientConfig clientConfig;
    @Autowired
    private JwtConfig jwtConfig;
    @Autowired
    private ClientAuthFeign clientAuthFeign;
    @Autowired
    private ClientTokenUtil clientTokenUtil;
    private String clientToken;

    @Override
    public void apply(RequestTemplate requestTemplate) {
        if(this.clientToken == null)
            this.refresh();
        requestTemplate.header(clientConfig.getClientTokenHeader(), this.clientToken);
        requestTemplate.header(jwtConfig.getTokenHeader(), BaseContextHandler.getToken());
    }

    @Scheduled(cron = "0 0/5 * * * ?")
    public void refresh(){
        try{
            logger.info("refresh.....");
            clientTokenUtil.getInfoFromToken(this.clientToken);
        }catch (Exception e){
            BaseResponse resp = clientAuthFeign.getAccessToken(clientConfig.getClientId(), clientConfig.getClientSecret());
            if (resp.getStatus() == 200) {
                ObjectRestResponse<String> clientToken = (ObjectRestResponse<String>) resp;
                this.clientToken = clientToken.getData();
            }
        }
    }
}
