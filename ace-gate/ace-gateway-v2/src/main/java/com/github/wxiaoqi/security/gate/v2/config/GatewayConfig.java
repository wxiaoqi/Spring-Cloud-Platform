package com.github.wxiaoqi.security.gate.v2.config;

import com.github.wxiaoqi.security.gate.v2.handler.RequestBodyRoutePredicateFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author ace
 * @create 2019/1/27.
 */
@Configuration
public class GatewayConfig {
    @Bean
    RequestBodyRoutePredicateFactory requestBodyRoutePredicateFactory() {
        return new RequestBodyRoutePredicateFactory();
    }
}
