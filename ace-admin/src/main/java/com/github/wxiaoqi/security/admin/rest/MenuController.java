package com.github.wxiaoqi.security.admin.rest;

import com.github.pagehelper.PageHelper;
import com.github.wxiaoqi.security.admin.biz.MenuBiz;
import com.github.wxiaoqi.security.admin.entity.Menu;
import com.github.wxiaoqi.security.admin.entity.User;
import com.github.wxiaoqi.security.common.msg.ListRestResponse;
import com.github.wxiaoqi.security.common.msg.ObjectRestResponse;
import com.github.wxiaoqi.security.common.msg.TableResultResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-12 8:49
 */
@Controller
@RequestMapping("menu")
public class MenuController {
    @Autowired
    private MenuBiz menuBiz;
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse<Menu> page(int limit, int offset, String title){
        Example example = new Example(Menu.class);
        example.createCriteria().andLike("title",title);
        int count = menuBiz.selectCountByExample(example);
        PageHelper.startPage(offset, limit);
        return new TableResultResponse<Menu>(count,menuBiz.selectByExample(example));
    }

    @RequestMapping(value = "",method = RequestMethod.POST)
    @ResponseBody
    public ObjectRestResponse<Menu> add(Menu menu){
        menuBiz.insertSelective(menu);
        return new ObjectRestResponse<User>().rel(true);
    }
}
