package com.github.wxiaoqi.security.gate.biz;

import com.github.wxiaoqi.security.api.user.vo.UserInfo;
import com.github.wxiaoqi.security.gate.rpc.IUserService;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-21 8:39
 */
@RestController
public class UserSecurity {
    @Lazy
    @Autowired
    private IUserService userService;

    @RequestMapping("test")
    @ResponseBody
    @HystrixCommand(fallbackMethod = "fallbackMethod")
    public UserInfo hello(){
        return userService.getUserByUsername("admin");
    }
    public String fallbackMethod(){
        return "failure!";
    }
}
