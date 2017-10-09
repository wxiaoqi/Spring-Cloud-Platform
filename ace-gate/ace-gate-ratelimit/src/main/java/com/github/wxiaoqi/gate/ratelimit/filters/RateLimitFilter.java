/*
 * Copyright 2012-2017 the original author or authors.
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
 */

package com.github.wxiaoqi.gate.ratelimit.filters;

import com.github.wxiaoqi.gate.ratelimit.config.IUserPrincipal;
import com.github.wxiaoqi.gate.ratelimit.config.Rate;
import com.github.wxiaoqi.gate.ratelimit.config.RateLimiter;
import com.github.wxiaoqi.gate.ratelimit.config.properties.RateLimitProperties;
import com.github.wxiaoqi.gate.ratelimit.config.properties.RateLimitProperties.Policy;
import com.github.wxiaoqi.gate.ratelimit.config.properties.RateLimitProperties.Policy.Type;
import com.google.common.net.HttpHeaders;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import lombok.RequiredArgsConstructor;
import org.springframework.cloud.netflix.zuul.filters.Route;
import org.springframework.cloud.netflix.zuul.filters.RouteLocator;
import org.springframework.cloud.netflix.zuul.util.ZuulRuntimeException;
import org.springframework.web.util.UrlPathHelper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Optional;
import java.util.StringJoiner;

import static org.springframework.http.HttpStatus.TOO_MANY_REQUESTS;

/**
 * @author Marcos Barbero
 * @author Michal Šváb
 */
@RequiredArgsConstructor
public class RateLimitFilter extends ZuulFilter {

    public static final String LIMIT_HEADER = "X-RateLimit-Limit";
    public static final String REMAINING_HEADER = "X-RateLimit-Remaining";
    public static final String RESET_HEADER = "X-RateLimit-Reset";

    private static final String ANONYMOUS_USER = "anonymous";
    private static final UrlPathHelper URL_PATH_HELPER = new UrlPathHelper();

    private final RateLimiter rateLimiter;
    private final RateLimitProperties properties;
    private final RouteLocator routeLocator;
    private final IUserPrincipal userPrincipal;

    @Override
    public String filterType() {
        return "pre";
    }

    @Override
    public int filterOrder() {
        return -1;
    }

    @Override
    public boolean shouldFilter() {
        return properties.isEnabled() && policy().isPresent();
    }

    public Object run() {
        final RequestContext ctx = RequestContext.getCurrentContext();
        final HttpServletResponse response = ctx.getResponse();
        final HttpServletRequest request = ctx.getRequest();

        policy().ifPresent(policy -> {
            final Rate rate = rateLimiter.consume(policy, key(request, policy.getType()));
            response.setHeader(LIMIT_HEADER, policy.getLimit().toString());
            response.setHeader(REMAINING_HEADER, String.valueOf(Math.max(rate.getRemaining(), 0)));
            response.setHeader(RESET_HEADER, rate.getReset().toString());
            if (rate.getRemaining() < 0) {
                ctx.setResponseStatusCode(TOO_MANY_REQUESTS.value());
                ctx.put("rateLimitExceeded", "true");
                throw new ZuulRuntimeException(new ZuulException(TOO_MANY_REQUESTS.toString(),
                        TOO_MANY_REQUESTS.value(), null));
            }
        });
        return null;
    }

    private Route route() {
        String requestURI = URL_PATH_HELPER.getPathWithinApplication(RequestContext.getCurrentContext().getRequest());
        return routeLocator.getMatchingRoute(requestURI);
    }

    private Optional<Policy> policy() {
        Route route = route();
        if (route != null) {
            return properties.getPolicy(route.getId());
        }
        return Optional.ofNullable(properties.getDefaultPolicy());
    }

    private String key(final HttpServletRequest request, final List<Type> types) {
        final Route route = route();
        final StringJoiner joiner = new StringJoiner(":");
        joiner.add(properties.getKeyPrefix());
        joiner.add(route.getId());
        if (!types.isEmpty()) {
            if (types.contains(Type.URL)) {
                joiner.add(route.getPath());
            }
            if (types.contains(Type.ORIGIN)) {
                joiner.add(getRemoteAddr(request));
            }
            if (types.contains(Type.USER)) {
                joiner.add(userPrincipal.getName(request)!= null ? userPrincipal.getName(request) : ANONYMOUS_USER);
            }
        }
        return joiner.toString();
    }

    private String getRemoteAddr(final HttpServletRequest request) {
        if (properties.isBehindProxy() && request.getHeader(HttpHeaders.X_FORWARDED_FOR) != null) {
            return request.getHeader(HttpHeaders.X_FORWARDED_FOR);
        }
        return request.getRemoteAddr();
    }
}
