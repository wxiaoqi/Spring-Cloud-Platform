package com.github.wxiaoqi.security.gate.service;

import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.github.wxiaoqi.security.gate.biz.UserSecurity;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-22 13:00
 */
@Service
public class GateUserDetailsService implements UserDetailsService {
  @Autowired
  private UserSecurity userSecurity;

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    if (StringUtils.isBlank(username)) {
      throw new UsernameNotFoundException("用户名为空");
    }

    UserInfo info = userSecurity.getUserByUsername(username);
    Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
    return new org.springframework.security.core.userdetails.User(username, info.getPassword(),
        true, // 是否可用
        true, // 是否过期
        true, // 证书不过期为true
        true, // 账户未锁定为true
        authorities);
  }
}
