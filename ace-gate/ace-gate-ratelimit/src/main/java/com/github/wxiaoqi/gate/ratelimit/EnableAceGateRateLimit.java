package com.github.wxiaoqi.gate.ratelimit;

import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * Created by ace on 2017/9/24.
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Import(RateLimitAutoConfiguration.class)
@Documented
@Inherited
public @interface EnableAceGateRateLimit {
}
