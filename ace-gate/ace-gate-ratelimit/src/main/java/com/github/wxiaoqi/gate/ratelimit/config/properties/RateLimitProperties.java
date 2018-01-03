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

package com.github.wxiaoqi.gate.ratelimit.config.properties;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

/**
 * @author Marcos Barbero
 */
@Data
@Validated
@NoArgsConstructor
@ConfigurationProperties(RateLimitProperties.PREFIX)
public class RateLimitProperties {

    public static final String PREFIX = "zuul.ratelimit";

    private Policy defaultPolicy;
    @NotNull
    private Map<String, Policy> policies = Maps.newHashMap();
    private boolean behindProxy;
    private boolean enabled;
    @NotNull
    @Value("${spring.application.name:rate-limit-application}")
    private String keyPrefix;
    @NotNull
    private Repository repository = Repository.IN_MEMORY;

    public enum Repository {
        REDIS, CONSUL, JPA, IN_MEMORY
    }

    public Optional<Policy> getPolicy(String key) {
        return Optional.ofNullable(policies.getOrDefault(key, defaultPolicy));
    }

    @Data
    @NoArgsConstructor
    public static class Policy {

        @NotNull
        private Long refreshInterval = TimeUnit.MINUTES.toSeconds(1L);
        @NotNull
        private Long limit;
        @NotNull
        private List<Type> type = Lists.newArrayList();

        public enum Type {
            ORIGIN, USER, URL
        }
    }
}