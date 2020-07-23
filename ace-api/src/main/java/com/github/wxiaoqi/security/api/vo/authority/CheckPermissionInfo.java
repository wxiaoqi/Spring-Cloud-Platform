package com.github.wxiaoqi.security.api.vo.authority;

import lombok.Data;

import java.util.function.Consumer;

/**
 * @author Ths Sun
 * @create 2020/7/23.
 */
@Data
public class CheckPermissionInfo{
    // 请求权限资源
    private PermissionInfo permissionInfo;
    // 是否有权限
    private Boolean isAuth;
}
