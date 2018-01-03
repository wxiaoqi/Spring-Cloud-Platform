package com.github.wxiaoqi.security.gate.feign;

import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import feign.Param;
import feign.RequestLine;

import java.util.List;


/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-21 8:11
 */
public interface IUserService {
  @RequestLine(value = "GET /api/user/un/{username}/permissions")
  public List<PermissionInfo> getPermissionByUsername(@Param("username") String username);
  @RequestLine(value = "GET /api/permissions")
  List<PermissionInfo> getAllPermissionInfo();
}
