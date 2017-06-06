package com.github.wxiaoqi.security.admin.rest;

import com.github.wxiaoqi.security.agent.api.IHello;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Ace on 2017/5/27.
 */
@RestController
public class HelloController implements IHello {

  @Override
  @HystrixCommand(fallbackMethod = "helloFallbackMethod")
  public String getHello() {
    return "hello world";
  }

  public String helloFallbackMethod(){
    return "failure";
  }

}
