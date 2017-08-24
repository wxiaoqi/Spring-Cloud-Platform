package com.github.wxiaoqi.blog.ui;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

/**
 * Created by ace on 2017/7/15.
 */
@SpringBootApplication
public class BlogUIBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(BlogUIBootstrap.class).web(true).run(args);    }
}
