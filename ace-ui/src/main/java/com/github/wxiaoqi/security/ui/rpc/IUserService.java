package com.github.wxiaoqi.security.ui.rpc;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;

import java.util.List;


/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-21 8:11
 */
@FeignClient("admin-back")
@RequestMapping("api")
public interface IUserService {
  @RequestMapping(value = "/user/username/{username}", method = RequestMethod.GET)
  public UserInfo getUserByUsername(@PathVariable("username") String username);
  @RequestMapping(value = "/user/un/{username}/permissions", method = RequestMethod.GET)
  public List<PermissionInfo> getPermissionByUserId(@PathVariable("username") String username);
  @RequestMapping(value = "/user/un/{username}/system", method = RequestMethod.GET)
  public String getSystemsByUsername(@PathVariable("username") String username);
  @RequestMapping(value = "/user/un/{username}/menu/parent/{parentId}", method = RequestMethod.GET)
  public String getMenusByUsername(@PathVariable("username") String username,@PathVariable("parentId") Integer parentId);
}
