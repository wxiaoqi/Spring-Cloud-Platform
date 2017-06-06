package com.github.wxiaoqi.security.agent.rest;

import com.github.wxiaoqi.security.agent.api.IHello;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Ace on 2017/5/27.
 */
@RestController
@RequestMapping("agent")
public class HelloAgent {
  @Autowired
  private IHello hello;

  @HystrixCommand(fallbackMethod = "helloFallbackMethod")
  @RequestMapping("/test")
  @ResponseBody
  public String sayHello() {
    return hello.getHello();
  }

  public String helloFallbackMethod() {
      return "熔断器调用，回调失败！";
  }
}
