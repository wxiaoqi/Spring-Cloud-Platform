package com.github.wxiaoqi.security.api.gate.feign;

import com.github.wxiaoqi.security.api.agent.feign.AuthenticationInterceptor;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by ace on 2017/7/5.
 */
@Configuration
public class FeignApiConfig {
    @Value("${gate.client.clientId}")
    private String clientId;
    @Value("${gate.client.secret}")
    private String secret;

    //    @Value("${gate.client.authHeader}")
//    private String authHeader;
//    @Value("${gate.client.authHost}")
//    private String authHost;
//    @Value("${gate.client.tokenHead}")
//    private String tokenHead;
//    @Bean
//    public AuthenticationInterceptor authenticationInterceptor(){
//        return new AuthenticationInterceptor(clientId,secret,authHeader,authHost,tokenHead);
//    }
    @Bean
    public RequestInterceptor authenticationInterceptor() {
        return new RequestInterceptor() {
            @Override
            public void apply(RequestTemplate requestTemplate) {
                requestTemplate.header("clientId", clientId);
                requestTemplate.header("secret", secret);
            }
        };
    }

}
