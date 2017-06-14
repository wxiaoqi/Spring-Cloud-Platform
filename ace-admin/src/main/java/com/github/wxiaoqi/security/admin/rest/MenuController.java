package com.github.wxiaoqi.security.admin.rest;

import com.github.pagehelper.PageHelper;
import com.github.wxiaoqi.security.admin.biz.MenuBiz;
import com.github.wxiaoqi.security.admin.entity.Menu;
import com.github.wxiaoqi.security.admin.entity.User;
import com.github.wxiaoqi.security.common.msg.ListRestResponse;
import com.github.wxiaoqi.security.common.msg.TableResultResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
        Menu example = null;
        if(StringUtils.isBlank(title))
            example = new Menu();
        else
            example = new Menu(title);
        Long count = menuBiz.selectCount(example);
        PageHelper.startPage(offset, limit);
        return new TableResultResponse<Menu>(count.intValue(),menuBiz.selectList(example));
    }
}
