package com.github.wxiaoqi.security.admin.rest;

import com.github.pagehelper.PageHelper;
import com.github.wxiaoqi.security.admin.biz.MenuBiz;
import com.github.wxiaoqi.security.admin.entity.Menu;
import com.github.wxiaoqi.security.admin.vo.MenuTree;
import com.github.wxiaoqi.security.common.msg.ListRestResponse;
import com.github.wxiaoqi.security.common.rest.BaseController;
import com.github.wxiaoqi.security.common.msg.TableResultResponse;
import com.github.wxiaoqi.security.common.util.TreeUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-12 8:49
 */
@Controller
@RequestMapping("menu")
public class MenuController extends BaseController<MenuBiz,Menu> {
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse<Menu> page(int limit, int offset, String title){
        Example example = new Example(Menu.class);
        example.createCriteria().andLike("title", "%" + title + "%");
        int count = baseBiz.selectCountByExample(example);
        PageHelper.startPage(offset, limit);
        return new TableResultResponse<Menu>(count,baseBiz.selectByExample(example));
    }

    @RequestMapping(value = "/all",method = RequestMethod.GET)
    @ResponseBody
    public ListRestResponse<List<Menu>> page(){
        return new ListRestResponse<List<Menu>>().rel(true).result(baseBiz.selectListAll());
    }

    @RequestMapping(value = "/all",method = RequestMethod.GET)
    @ResponseBody
    public List<MenuTree> menuList(){
        List<MenuTree> trees = new ArrayList<MenuTree>();
        MenuTree node = null;
        for(Menu menu:baseBiz.selectListAll()){
            node = new MenuTree();
            BeanUtils.copyProperties(menu,node);
            trees.add(node);
        }
       return TreeUtil.bulid(trees);
    }

}
