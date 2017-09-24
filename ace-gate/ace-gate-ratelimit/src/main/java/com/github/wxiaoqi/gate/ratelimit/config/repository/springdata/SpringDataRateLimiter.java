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

package com.github.wxiaoqi.gate.ratelimit.config.repository.springdata;

import com.github.wxiaoqi.gate.ratelimit.config.Rate;
import com.github.wxiaoqi.gate.ratelimit.config.repository.AbstractRateLimiter;
import lombok.RequiredArgsConstructor;

/**
 * In memory rate limiter configuration for dev environment.
 *
 * @author Marcos Barbero
 * @since 2017-06-23
 */
@RequiredArgsConstructor
public class SpringDataRateLimiter extends AbstractRateLimiter {

    private final IRateLimiterRepository repository;

    @Override
    protected Rate getRate(String key) {
        return this.repository.findOne(key);
    }

    @Override
    protected void saveRate(Rate rate) {
        this.repository.save(rate);
    }

}
