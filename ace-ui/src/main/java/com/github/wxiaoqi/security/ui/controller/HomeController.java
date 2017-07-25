package com.github.wxiaoqi.security.ui.controller;

import com.github.wxiaoqi.security.ui.rpc.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-06 13:34
 */
@Controller
@RequestMapping("")
public class HomeController extends BaseController{
    @Autowired
    private IUserService userService;


    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String index(Map<String,Object> map){
        map.put("user",userService.getUserByUsername(getCurrentUserName()));
        return "index";
    }
    @RequestMapping(value = "about",method = RequestMethod.GET)
    public String about(){
        return "about";
    }
    @RequestMapping(value = "user",method = RequestMethod.GET)
    public String user(){
        return "user/list";
    }
    @RequestMapping(value = "user/edit",method = RequestMethod.GET)
    public String userEdit(){
        return "user/edit";
    }
    @RequestMapping(value = "menu",method = RequestMethod.GET)
    public String menu(){
        return "menu/list";
    }
    @RequestMapping(value = "menu/edit",method = RequestMethod.GET)
    public String menuEdit(){
        return "menu/edit";
    }
    @RequestMapping(value = "group",method = RequestMethod.GET)
    public String group(){
        return "group/list";
    }
    @RequestMapping(value = "group/user",method = RequestMethod.GET)
    public String groupUser(){
        return "group/user";
    }
    @RequestMapping(value = "group/authority",method = RequestMethod.GET)
    public String groupAuthority(){
        return "group/authority";
    }
    @RequestMapping(value = "group/edit",method = RequestMethod.GET)
    public String groupEdit(){
        return "group/edit";
    }
    @RequestMapping(value = "groupType",method = RequestMethod.GET)
    public String groupType(){
        return "groupType/list";
    }
    @RequestMapping(value = "groupType/edit",method = RequestMethod.GET)
    public String groupTypeEdit(){
        return "groupType/edit";
    }
    @RequestMapping(value="element/edit",method = RequestMethod.GET)
    public String elementEdit(){
        return "element/edit";
    }
    @RequestMapping(value = "gateClient",method = RequestMethod.GET)
    public String gateClient(){
        return "gateClient/list";
    }
    @RequestMapping(value = "gateClient/edit",method = RequestMethod.GET)
    public String gateClientEdit(){
        return "gateClient/edit";
    }
    @RequestMapping(value = "gateClient/authority",method = RequestMethod.GET)
    public String gateClientAuthority(){
        return "gateClient/authority";
    }
    @RequestMapping(value = "gateLog",method = RequestMethod.GET)
    public String gateLog(){
        return "gateLog/list";
    }
    @RequestMapping(value = "service",method = RequestMethod.GET)
    public String service(){
        return "service/list";
    }

}
