package com.github.wxiaoqi.security.agent.api;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Ace on 2017/5/27.
 */
@FeignClient("ace-admin")
public interface IHello {
    @RequestMapping(value = "/hello",method = RequestMethod.GET)
    String getHello();
}