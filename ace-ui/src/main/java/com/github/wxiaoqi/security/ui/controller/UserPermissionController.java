package com.github.wxiaoqi.security.ui.controller;

import com.github.wxiaoqi.security.ui.rpc.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-27 12:40
 */
@Controller
public class UserPermissionController  extends BaseController{
    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/user/system",method = RequestMethod.GET)
    @ResponseBody
    public String getUserSystem(){
       return userService.getSystemsByUsername(getCurrentUserName());
    }
    @RequestMapping(value = "/user/menu",method = RequestMethod.GET)
    @ResponseBody
    public String getUserMenu(@RequestParam(defaultValue = "-1") Integer parentId){
        return userService.getMenusByUsername(getCurrentUserName(),parentId);
    }
}
