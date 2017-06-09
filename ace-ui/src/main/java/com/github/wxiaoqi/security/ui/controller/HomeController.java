package com.github.wxiaoqi.security.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-06 13:34
 */
@Controller
@RequestMapping("")
public class HomeController {
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String index(){
        return "index";
    }
    @RequestMapping(value = "about",method = RequestMethod.GET)
    public String about(){
        return "about";
    }
    @RequestMapping(value = "user",method = RequestMethod.GET)
    public String user(){
        return "user";
    }
}
