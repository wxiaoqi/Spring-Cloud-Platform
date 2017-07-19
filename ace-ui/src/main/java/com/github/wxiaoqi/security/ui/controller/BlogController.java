package com.github.wxiaoqi.security.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ace on 2017/7/15.
 */
@Controller
@RequestMapping("blog")
public class BlogController {
    @RequestMapping("article")
    public String article(){
        return "blog/article/list";
    }
    @RequestMapping("article/edit")
    public String articleEdit(){
        return "blog/article/edit";
    }
}
