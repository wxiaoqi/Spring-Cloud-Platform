package com.github.wxiaoqi.security.modules.auth.service.impl;

import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.github.wxiaoqi.security.common.exception.auth.UserInvalidException;
import com.github.wxiaoqi.security.common.util.jwt.JWTInfo;
import com.github.wxiaoqi.security.modules.admin.rpc.service.PermissionService;
import com.github.wxiaoqi.security.modules.auth.service.AuthService;
import com.github.wxiaoqi.security.modules.auth.util.user.JwtAuthenticationRequest;
import com.github.wxiaoqi.security.modules.auth.util.user.JwtTokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class AuthServiceImpl implements AuthService {

    private JwtTokenUtil jwtTokenUtil;
    private PermissionService permissionService;
    @Autowired
    public AuthServiceImpl(
            JwtTokenUtil jwtTokenUtil,
            PermissionService userService) {
        this.jwtTokenUtil = jwtTokenUtil;
        this.permissionService = userService;
    }

    @Override
    public String login(JwtAuthenticationRequest authenticationRequest) throws Exception {
        UserInfo info = permissionService.validate(authenticationRequest.getUsername(),authenticationRequest.getPassword());
        if (!StringUtils.isEmpty(info.getId())) {
            return jwtTokenUtil.generateToken(new JWTInfo(info.getUsername(), info.getId() + "", info.getName()));
        }
        throw new UserInvalidException("用户不存在或账户密码错误!");
    }

    @Override
    public void validate(String token) throws Exception {
        jwtTokenUtil.getInfoFromToken(token);
    }

    @Override
    public String refresh(String oldToken) throws Exception {
        return jwtTokenUtil.generateToken(jwtTokenUtil.getInfoFromToken(oldToken));
    }
}
