package com.github.wxiaoqi.security.auth.client.listener;

import com.github.wxiaoqi.security.auth.common.event.AuthRemoteEvent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

/**
 * @author ace
 * @create 2017/11/4.
 */
//自定义事件侦听
@Component
@Slf4j
public class AuthRemoteEventListener implements ApplicationListener<AuthRemoteEvent> {

    //处理自定义事件
    @Override
    public void onApplicationEvent(AuthRemoteEvent myCustomRemoteEvent) {
        log.info("Received AuthRemoteEvent - message: " + myCustomRemoteEvent.getMessage());
    }
}
