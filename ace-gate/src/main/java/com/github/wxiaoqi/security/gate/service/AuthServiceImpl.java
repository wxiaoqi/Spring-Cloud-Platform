package com.github.wxiaoqi.security.gate.service;

import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.github.wxiaoqi.security.common.constant.BaseConstants;
import com.github.wxiaoqi.security.gate.jwt.JwtTokenUtil;
import com.github.wxiaoqi.security.gate.rpc.IUserService;
import com.github.wxiaoqi.security.gate.vo.FrontUser;
import com.google.common.base.Predicate;
import com.google.common.collect.Collections2;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class AuthServiceImpl implements AuthService {

    private JwtTokenUtil jwtTokenUtil;
    private IUserService userService;
    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);

    @Autowired
    public AuthServiceImpl(
            JwtTokenUtil jwtTokenUtil,
            IUserService userService) {
        this.jwtTokenUtil = jwtTokenUtil;
        this.userService = userService;
    }


    @Override
    public String login(String username, String password) {
        UserInfo info = userService.getUserByUsername(username);
        String token = "";
        if(encoder.matches(password,info.getPassword())) {
           token = jwtTokenUtil.generateToken(info);
        }
        return token;
    }

    @Override
    public String refresh(String token) {
        String username = jwtTokenUtil.getUsernameFromToken(token);
        UserInfo info = userService.getUserByUsername(username);
        if (jwtTokenUtil.canTokenBeRefreshed(token,info.getUpdTime())){
            return jwtTokenUtil.refreshToken(token);
        }
        return null;
    }

    @Override
    public Boolean validate(String token,String resource) {
        String username = jwtTokenUtil.getUsernameFromToken(token);
        UserInfo info = userService.getUserByUsername(username);
        return info.getUsername().equals(username)&&!jwtTokenUtil.isTokenExpired(token)&&validateResource(username,resource);
    }

    @Override
    public FrontUser getUserInfo(String token) {
        String username = jwtTokenUtil.getUsernameFromToken(token);
        if(username==null)
            return null;
        UserInfo user = userService.getUserByUsername(username);
        FrontUser frontUser  = new FrontUser();
        BeanUtils.copyProperties(user,frontUser);
        List<PermissionInfo> permissionInfos = userService.getPermissionByUsername(username);
        Stream<PermissionInfo> menus = permissionInfos.parallelStream().filter((permission) -> {
            return permission.getType().equals(BaseConstants.RESOURCE_TYPE_MENU);
        });
        frontUser.setMenus(menus.collect(Collectors.toList()));
        Stream<PermissionInfo> elements = permissionInfos.parallelStream().filter((permission) -> {
            return !permission.getType().equals(BaseConstants.RESOURCE_TYPE_MENU);
        });
        frontUser.setElements(elements.collect(Collectors.toList()));
        return frontUser;
    }

    @Override
    public Boolean invalid(String token) {
        return jwtTokenUtil.invalid(token);
    }

    public Boolean validateResource(String username, String resource){
        String [] res = resource.split(":");
        final String requestUri = res[0];
        final String method = res[1];
        List<PermissionInfo> clientPermissionInfo = userService.getPermissionByUsername(username);
        Collection<PermissionInfo> result = Collections2.filter(clientPermissionInfo, new Predicate<PermissionInfo>() {
            @Override
            public boolean apply(PermissionInfo permissionInfo) {
                String url = permissionInfo.getUri();
                String uri = url.replaceAll("\\{\\*\\}", "[a-zA-Z\\\\d]+");
                String regEx = "^" + uri + "$";
                return (Pattern.compile(regEx).matcher(requestUri).find() || requestUri.startsWith(url + "/"))
                        && method.equals(permissionInfo.getMethod());
            }
        });
        if (result.size() <= 0) {
            return false;
        }
        return true;
    }
}
