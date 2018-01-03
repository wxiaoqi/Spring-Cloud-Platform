package com.github.wxiaoqi.security.auth.client.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 忽略服务鉴权
 * Created by ace on 2017/9/27.
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(value={ElementType.METHOD,ElementType.TYPE})
public @interface IgnoreClientToken {
}
