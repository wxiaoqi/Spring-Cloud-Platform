package com.github.wxiaoqi.security.admin.rest;

import com.github.pagehelper.PageHelper;
import com.github.wxiaoqi.security.admin.biz.UserBiz;
import com.github.wxiaoqi.security.admin.entity.User;
import com.github.wxiaoqi.security.common.msg.ListRestResponse;
import com.github.wxiaoqi.security.common.msg.ObjectRestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-08 11:51
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Lazy
    @Autowired
    private UserBiz userService;
    @RequestMapping(value = "/page/{pageIndex}/{pageSize}",method = RequestMethod.GET)
    @ResponseBody
    public List<User> list(@PathVariable int pageIndex,@PathVariable int pageSize){
        PageHelper.startPage(pageIndex, pageSize);
       return userService.selectListAll();
    }
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public ListRestResponse<List<User>> page(int pageIndex, int pageSize){
        Long count = userService.selectCount(new User());
        PageHelper.startPage(pageIndex, pageSize);
        return new ListRestResponse<List<User>>().rel(true).result(userService.selectListAll()).count(count.intValue());
    }
    @RequestMapping(value = "",method = RequestMethod.POST)
    @ResponseBody
    public ObjectRestResponse<User> add(User user){
        userService.insertSelective(user);
        return new ObjectRestResponse<User>().rel(true);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @ResponseBody
    public ObjectRestResponse<User> get(@PathVariable int id){
        return new ObjectRestResponse<User>().rel(true).result(userService.selectById(id));
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public ObjectRestResponse<User> get(User user){
        userService.updateById(user);
        return new ObjectRestResponse<User>().rel(true);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public ObjectRestResponse<User> remove(@PathVariable int id){
        userService.deleteById(id);
        return new ObjectRestResponse<User>().rel(true);
    }
}
