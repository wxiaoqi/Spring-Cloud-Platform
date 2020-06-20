package com.github.wxiaoqi.security.gate.service;

import com.alibaba.fastjson.JSON;
import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.gate.feign.IUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author the sun
 * @create 2020/6/14.
 */
@Component
public class UserServiceImpl implements UserService {
    @Autowired
    @Lazy
    private IUserService userService;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    private final String REDIS_KEY_USER_PERMISISON = "gate:permissions:%s";

    private final String REDIS_KEY_ALL_PERMISISON = "gate:permissions";


    @Override
    public List<PermissionInfo> getPermissionByUsername(String username) {
        String key = String.format(REDIS_KEY_USER_PERMISISON, username);
        String s = stringRedisTemplate.opsForValue().get(key);
        if (s == null || StringUtils.isBlank(s)) {
            List<PermissionInfo> permissionByUsername = userService.getPermissionByUsername(username);
            stringRedisTemplate.opsForValue().set(key, JSON.toJSONString(permissionByUsername), 12, TimeUnit.HOURS);
        }
        List<PermissionInfo> permissionInfos = JSON.parseArray(s, PermissionInfo.class);
        return permissionInfos;
    }

    @Override
    public List<PermissionInfo> getAllPermissionInfo() {
        String key = REDIS_KEY_ALL_PERMISISON;
        String s = stringRedisTemplate.opsForValue().get(key);
        if (s == null || StringUtils.isBlank(s)) {
            List<PermissionInfo> permissionByUsername = userService.getAllPermissionInfo();
            stringRedisTemplate.opsForValue().set(key, JSON.toJSONString(permissionByUsername), 12, TimeUnit.HOURS);
        }
        List<PermissionInfo> permissionInfos = JSON.parseArray(s, PermissionInfo.class);
        return permissionInfos;
    }
}
