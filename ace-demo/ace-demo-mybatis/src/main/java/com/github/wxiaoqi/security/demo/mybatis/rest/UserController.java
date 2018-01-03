package com.github.wxiaoqi.security.demo.mybatis.rest;

import com.github.wxiaoqi.security.common.rest.BaseController;
import com.github.wxiaoqi.security.demo.mybatis.biz.UserBiz;
import com.github.wxiaoqi.security.demo.mybatis.entity.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-08 11:51
 */
@RestController
@RequestMapping("/demo/user")
public class UserController extends BaseController<UserBiz,User> {

}
