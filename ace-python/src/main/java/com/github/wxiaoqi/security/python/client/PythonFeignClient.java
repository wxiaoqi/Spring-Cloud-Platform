package com.github.wxiaoqi.security.python.client;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import com.github.wxiaoqi.security.python.entity.Message;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author yangyongjie
 * @create 2017-10-22 20:30
 */
@FeignClient(name = "ace-sidecar")
public interface PythonFeignClient {
    //parse param like /message?id=12
    @RequestMapping("/message/{id}")
    List<Message> getMsg(@RequestParam("id") Long id);
    //parse url like /test
    @RequestMapping("/test")
    String getTest();
}