package com.github.wxiaoqi.security.admin.rpc;

import com.github.wxiaoqi.security.admin.rpc.service.PermissionService;
import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-21 8:15
 */
@RestController
@RequestMapping("api")
public class UserRest {
    @Autowired
    private PermissionService permissionService;

    @RequestMapping(value = "/user/username/{username}",method = RequestMethod.GET, produces="application/json")
    public  @ResponseBody UserInfo getUserByUsername(@PathVariable("username")String username) {
        return permissionService.getUserByUsername(username);
    }

    @RequestMapping(value = "/permissions", method = RequestMethod.GET)
    public @ResponseBody List<PermissionInfo> getAllPermission(){
        return permissionService.getAllPermission();
    }


    @RequestMapping(value = "/user/un/{username}/permissions", method = RequestMethod.GET)
    public @ResponseBody List<PermissionInfo> getPermissionByUsername(@PathVariable("username") String username){
        return permissionService.getPermissionByUsername(username);
    }
}
