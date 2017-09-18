package com.github.wxiaoqi.security.center.listener;

import com.netflix.discovery.shared.Applications;
import com.netflix.eureka.EurekaServerContextHolder;
import com.netflix.eureka.registry.PeerAwareInstanceRegistry;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.netflix.eureka.server.event.EurekaInstanceCanceledEvent;
import org.springframework.cloud.netflix.eureka.server.event.EurekaInstanceRegisteredEvent;
import org.springframework.cloud.netflix.eureka.server.event.EurekaInstanceRenewedEvent;
import org.springframework.cloud.netflix.eureka.server.event.EurekaRegistryAvailableEvent;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.Objects;

/**
 * 用于监听Eureka服务停机通知
 *
 * @author HeHaoyang
 * @create 2017-09-12 12:00
 **/
@Configuration
@Slf4j
@EnableScheduling
public class EurekaInstanceCanceledListener implements ApplicationListener {

    @Override
    public void onApplicationEvent(ApplicationEvent applicationEvent) {
        //服务挂掉自动通知
        if(applicationEvent instanceof EurekaInstanceCanceledEvent){
            EurekaInstanceCanceledEvent event = (EurekaInstanceCanceledEvent)applicationEvent;
            //获取当前Eureka示例中的节点信息
            PeerAwareInstanceRegistry registry = EurekaServerContextHolder.getInstance().getServerContext().getRegistry();
            Applications applications = registry.getApplications();
            //便利获取已注册节点中与当前失效节点ID一致 的节点信息
            applications.getRegisteredApplications().forEach(registryApplication -> {
                registryApplication.getInstances().forEach(instance -> {
                    if(Objects.equals(instance.getInstanceId(),event.getServerId())){
                        log.info("服务:{}挂啦。。。",instance.getAppName());
                    }
                });
            });
        }
        if(applicationEvent instanceof EurekaInstanceRegisteredEvent){
            EurekaInstanceRegisteredEvent event = (EurekaInstanceRegisteredEvent)applicationEvent;
            log.info("服务:{}注册成功啦。。。",event.getInstanceInfo().getAppName());
        }
        if (applicationEvent instanceof EurekaInstanceRenewedEvent) {
            EurekaInstanceRenewedEvent event = (EurekaInstanceRenewedEvent) applicationEvent;
            log.info("心跳检测服务：{}。。。" ,event.getInstanceInfo().getAppName());
        }
        if (applicationEvent instanceof EurekaRegistryAvailableEvent) {
            log.info("服务 Aualiable。。。");
        }
    }
}
