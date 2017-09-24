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

package com.github.wxiaoqi.gate.ratelimit.config.repository;

import com.github.wxiaoqi.gate.ratelimit.config.Rate;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * In memory rate limiter configuration for dev environment.
 *
 * @author Marcos Barbero
 * @since 2017-06-23
 */
public class InMemoryRateLimiter extends AbstractRateLimiter {

    private Map<String, Rate> repository = new ConcurrentHashMap<>();

    @Override
    protected Rate getRate(String key) {
        return this.repository.get(key);
    }

    @Override
    protected void saveRate(Rate rate) {
        this.repository.put(rate.getKey(), rate);
    }

}
