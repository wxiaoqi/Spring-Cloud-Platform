package com.github.wxiaoqi.security.admin.rpc;

import com.github.wxiaoqi.security.admin.biz.UserBiz;
import com.github.wxiaoqi.security.admin.constant.CommonConstant;
import com.github.wxiaoqi.security.admin.entity.Menu;
import com.github.wxiaoqi.security.admin.entity.User;
import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-21 8:15
 */
@Controller
public class UserService {
    @Autowired
    private UserBiz userBiz;

//    @HystrixCommand(fallbackMethod = "fallbackMethod")
    @RequestMapping(value = "/user/username/{username}",method = RequestMethod.GET, produces="application/json")
    public  @ResponseBody UserInfo getUserByUsername(@PathVariable("username")String username) {
        UserInfo info = new UserInfo();
        User user = userBiz.getUserByUsername(username);
        BeanUtils.copyProperties(user,info);
        info.setId(user.getId().toString());
        return info;
    }

    @RequestMapping(value = "/user/{id}/permissions", method = RequestMethod.GET)
    public @ResponseBody List<PermissionInfo> getPermissionByUserId(@PathVariable("id") String userId){
        List<Menu> menus = userBiz.getUserAuthroityMenu(Integer.parseInt(userId));
        List<PermissionInfo> result = new ArrayList<PermissionInfo>();
        PermissionInfo info = null;
        for(Menu menu:menus){
            info = new PermissionInfo();
            info.setCode(menu.getCode());
            info.setType(CommonConstant.RESOURCE_TYPE_MENU);
            info.setUri(menu.getHref());
            result.add(info
            );
        }
        return result;
    }
    public UserInfo fallbackMethod(String username){
        return new UserInfo();
    }
}
