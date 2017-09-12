package com.github.wxiaoqi.security.admin.interceptor;

import com.github.wxiaoqi.security.admin.feign.ClientAuthFeign;
import com.github.wxiaoqi.security.admin.util.ClientTokenUtil;
import com.github.wxiaoqi.security.common.exception.auth.ClientForbiddenException;
import com.github.wxiaoqi.security.common.msg.BaseResponse;
import com.github.wxiaoqi.security.common.msg.ObjectRestResponse;
import com.github.wxiaoqi.security.common.util.jwt.IJWTInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by ace on 2017/9/12.
 */
@SuppressWarnings("ALL")
@Configuration
public class ClientInterceptor extends HandlerInterceptorAdapter {
    private Logger logger = LoggerFactory.getLogger(ClientInterceptor.class);
    @Value("${client.token-header}")
    private String tokenHeader;

    @Autowired
    private ClientTokenUtil clientTokenUtil;

    @Autowired
    private ClientAuthFeign clientAuthFeign;

    @Value("${client.id}")
    private String clientId;
    @Value("${client.secret}")
    private String clientSecret;

    private List<String> allowedClient;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(this.allowedClient==null)
            refresh();
        String token = request.getHeader(tokenHeader);
        IJWTInfo infoFromToken = clientTokenUtil.getInfoFromToken(token);
        String uniqueName = infoFromToken.getUniqueName(); // clientName（code）
        for(String client:allowedClient){
            if(client.equals(uniqueName)){
                return super.preHandle(request, response, handler);
            }
        }
        throw new ClientForbiddenException("Client is Forbidden!");
    }

    @Scheduled(cron = "0 0/5 * * * ?")
    public void refresh() {
        logger.info("refresh.....");
        BaseResponse resp = clientAuthFeign.getAllowedClient(clientId, clientSecret);
        if (resp.getStatus() == 200) {
            ObjectRestResponse<List<String>> allowedClient = (ObjectRestResponse<List<String>>) resp;
            this.allowedClient = allowedClient.getData();
        }
    }
}
