package com.github.wxiaoqi.security.auth.common.event;

import lombok.Data;
import org.springframework.cloud.bus.event.RemoteApplicationEvent;

import java.util.List;

/**
 * @author ace
 * @create 2017/11/4.
 */
@Data
public class AuthRemoteEvent extends RemoteApplicationEvent {
    private List<String> allowedClient;

    //jackson序列化反序列化必须有无参构造函数
    public AuthRemoteEvent() {
    }

    public AuthRemoteEvent(Object source, String originService, String destinationService, List<String> allowedClient) {
        // source is the object that is publishing the event
        // originService is the unique context ID of the publisher
        super(source, originService, destinationService);
        this.allowedClient = allowedClient;
    }


}
