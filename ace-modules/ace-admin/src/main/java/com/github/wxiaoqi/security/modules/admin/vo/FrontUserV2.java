package com.github.wxiaoqi.security.modules.admin.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ace on 2017/8/22.
 */
@Data
public class FrontUserV2 {
    /**
     * 头像地址
     */
    public String avatarUrl;
    /**
     * 昵称
     */
    public String userName;
    /**
     * 角色列表
     */
    public List<String> userRoles;
    /**
     * 用户动作权限编码
     */
    private List<String> userPermissions = new ArrayList<>();
    /**
     * 可访问菜单
     */
    private List<AccessMenuTree> accessMenus = new ArrayList<>();

    private List<AccessMenuTree> accessHeader = new ArrayList<>();
    /**
     * 可访问路由
     */
    private List<AccessRouteTree> accessRoutes = new ArrayList<>();

    /**
     * 可访问接口
     */
    private List<AccessInterface> accessInterfaces = new ArrayList<>();

    private String isAdmin = "0";

}
