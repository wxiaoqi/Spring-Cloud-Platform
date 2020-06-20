package com.github.wxiaoqi.security.gate.service;

import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;


/**
 * ${DESCRIPTION}
 *
 * @author the sun
 * @create 2017-06-21 8:11
 */
public interface UserService {
  public List<PermissionInfo> getPermissionByUsername(@PathVariable("username") String username);
  List<PermissionInfo> getAllPermissionInfo();
}
