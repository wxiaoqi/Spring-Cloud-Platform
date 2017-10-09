package com.github.wxiaoqi.security.auth.feign;

import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.github.wxiaoqi.security.auth.configuration.FeignConfiguration;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;


/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-21 8:11
 */
@FeignClient(value = "admin-back",configuration = FeignConfiguration.class)
public interface IUserService {
  @RequestMapping(value = "/api/user/username/{username}", method = RequestMethod.GET)
  public UserInfo getUserByUsername(@PathVariable("username") String username);
  @RequestMapping(value = "/api/user/un/{username}/permissions", method = RequestMethod.GET)
  public List<PermissionInfo> getPermissionByUsername(@PathVariable("username") String username);
  @RequestMapping(value = "/api/permissions", method = RequestMethod.GET)
  List<PermissionInfo> getAllPermissionInfo();
}
