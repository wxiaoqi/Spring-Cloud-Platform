package com.github.wxiaoqi.security.auth.controller;

import com.github.wxiaoqi.security.auth.common.event.AuthRemoteEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ace
 * @create 2017/11/4.
 */

@RefreshScope //允许动态刷新配置
@RestController
public class MyController {

    //注入ApplicationContext,通过ApplicationContext来publish remote event
    private ApplicationContext context;

    @Autowired
    public MyController(ApplicationContext context) {
        this.context = context;
    }

    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    public String publish(@RequestParam(value = "destination", required = false, defaultValue = "**") String destination) {
        // each service instance must have a unique context ID
        final String myUniqueId = context.getId();

        final AuthRemoteEvent event =
                new AuthRemoteEvent(this, myUniqueId, destination, "hello world");
        //Since we extended RemoteApplicationEvent and we've configured the scanning of remote events using @RemoteApplicationEventScan, it will be treated as a bus event rather than just a regular ApplicationEvent published in the context.
        //因为我们在启动类上设置了@RemoteApplicationEventScan注解，所以通过context发送的时间将变成一个bus event总线事件，而不是在自身context中发布的一个ApplicationEvent
        context.publishEvent(event);

        return "event published";
    }

}