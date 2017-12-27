package com.github.wxiaoqi.security.auth.controller;

import com.github.wxiaoqi.security.auth.biz.ClientBiz;
import com.github.wxiaoqi.security.auth.entity.Client;
import com.github.wxiaoqi.security.common.rest.BaseController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ace
 * @create 2017/12/26.
 */
@RestController
@RequestMapping("service")
public class ServiceController extends BaseController<ClientBiz,Client>{

}
