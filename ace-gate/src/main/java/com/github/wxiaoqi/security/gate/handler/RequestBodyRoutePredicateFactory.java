/*
 * Copyright 2013-2018 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package com.github.wxiaoqi.security.gate.handler;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.cloud.gateway.handler.AsyncPredicate;
import org.springframework.cloud.gateway.handler.predicate.AbstractRoutePredicateFactory;
import org.springframework.cloud.gateway.handler.predicate.ReadBodyPredicateFactory;
import org.springframework.cloud.gateway.support.ServerWebExchangeUtils;
import org.springframework.core.annotation.Order;
import org.springframework.http.codec.HttpMessageReader;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.HandlerStrategies;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;

/**
 * This predicate is BETA and may be subject to change in a future release.
 */
@Slf4j
@Component
@Order(1)
public class RequestBodyRoutePredicateFactory
        extends AbstractRoutePredicateFactory<RequestBodyRoutePredicateFactory.Config> {
    protected static final Log LOGGER = LogFactory.getLog(ReadBodyPredicateFactory.class);
    private final List<HttpMessageReader<?>> messageReaders;

    public RequestBodyRoutePredicateFactory() {
        super(RequestBodyRoutePredicateFactory.Config.class);
        this.messageReaders = HandlerStrategies.withDefaults().messageReaders();
    }

    public RequestBodyRoutePredicateFactory(List<HttpMessageReader<?>> messageReaders) {
        super(RequestBodyRoutePredicateFactory.Config.class);
        this.messageReaders = messageReaders;
    }
    public static final String REQUEST_BODY_ATTR = "requestBodyAttr";


    @Override
    public AsyncPredicate<ServerWebExchange> applyAsync(Config config) {
        return exchange -> {
            if (!"POST".equals(exchange.getRequest().getMethodValue())&&!"PUT".equals(exchange.getRequest().getMethodValue())) {
                return Mono.just(true);
            }
            Object cachedBody = exchange.getAttribute(REQUEST_BODY_ATTR);
            if (cachedBody != null) {
                try {
                    return Mono.just(true);
                } catch (ClassCastException e) {
                    if (LOGGER.isDebugEnabled()) {
                        LOGGER.debug("Predicate test failed because class in predicate does not match the cached body object",
                                e);
                    }
                }
                return Mono.just(true);
            } else {
                return ServerWebExchangeUtils.cacheRequestBodyAndRequest(exchange, (serverHttpRequest) -> ServerRequest.create(exchange.mutate().request(serverHttpRequest).build(), this.messageReaders).bodyToMono(String.class).defaultIfEmpty("").doOnNext((objectValue) -> {
                    if(StringUtils.isBlank(objectValue)){
                        exchange.getAttributes().put(REQUEST_BODY_ATTR, JSON.toJSONString(exchange.getRequest().getQueryParams()));
                    }else {
                        exchange.getAttributes().put(REQUEST_BODY_ATTR, objectValue);
                    }
                }).map((objectValue) -> true));

            }
        };
    }

    @Override
    public Predicate<ServerWebExchange> apply(Config config) {
        throw new UnsupportedOperationException(
                "ReadBodyPredicateFactory is only async.");
    }

    public static class Config {
        private List<String> sources = new ArrayList<>();

        public List<String> getSources() {
            return sources;
        }

        public RequestBodyRoutePredicateFactory.Config setSources(List<String> sources) {
            this.sources = sources;
            return this;
        }

        public RequestBodyRoutePredicateFactory.Config setSources(String... sources) {
            this.sources = Arrays.asList(sources);
            return this;
        }
    }
}
