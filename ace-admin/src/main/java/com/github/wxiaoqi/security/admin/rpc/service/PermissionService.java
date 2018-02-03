package com.github.wxiaoqi.security.admin.rpc.service;

import com.github.wxiaoqi.security.admin.biz.ElementBiz;
import com.github.wxiaoqi.security.admin.biz.MenuBiz;
import com.github.wxiaoqi.security.admin.biz.UserBiz;
import com.github.wxiaoqi.security.admin.constant.AdminCommonConstant;
import com.github.wxiaoqi.security.admin.entity.Element;
import com.github.wxiaoqi.security.admin.entity.Menu;
import com.github.wxiaoqi.security.admin.entity.User;
import com.github.wxiaoqi.security.admin.vo.FrontUser;
import com.github.wxiaoqi.security.admin.vo.MenuTree;
import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.github.wxiaoqi.security.auth.client.jwt.UserAuthUtil;
import com.github.wxiaoqi.security.common.constant.CommonConstants;
import com.github.wxiaoqi.security.common.util.TreeUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Created by ace on 2017/9/12.
 */
@Service
public class PermissionService {
    @Autowired
    private UserBiz userBiz;
    @Autowired
    private MenuBiz menuBiz;
    @Autowired
    private ElementBiz elementBiz;
    @Autowired
    private UserAuthUtil userAuthUtil;
    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);


    public UserInfo getUserByUsername(String username) {
        UserInfo info = new UserInfo();
        User user = userBiz.getUserByUsername(username);
        BeanUtils.copyProperties(user, info);
        info.setId(user.getId().toString());
        return info;
    }

    public UserInfo validate(String username,String password){
        UserInfo info = new UserInfo();
        User user = userBiz.getUserByUsername(username);
        if (encoder.matches(password, user.getPassword())) {
            BeanUtils.copyProperties(user, info);
            info.setId(user.getId().toString());
        }
        return info;
    }

    public List<PermissionInfo> getAllPermission() {
        List<Menu> menus = menuBiz.selectListAll();
        List<PermissionInfo> result = new ArrayList<PermissionInfo>();
        PermissionInfo info = null;
        menu2permission(menus, result);
        List<Element> elements = elementBiz.getAllElementPermissions();
        element2permission(result, elements);
        return result;
    }

    private void menu2permission(List<Menu> menus, List<PermissionInfo> result) {
        PermissionInfo info;
        for (Menu menu : menus) {
            if (StringUtils.isBlank(menu.getHref())) {
                menu.setHref("/" + menu.getCode());
            }
            info = new PermissionInfo();
            info.setCode(menu.getCode());
            info.setType(AdminCommonConstant.RESOURCE_TYPE_MENU);
            info.setName(AdminCommonConstant.RESOURCE_ACTION_VISIT);
            String uri = menu.getHref();
            if (!uri.startsWith("/")) {
                uri = "/" + uri;
            }
            info.setUri(uri);
            info.setMethod(AdminCommonConstant.RESOURCE_REQUEST_METHOD_GET);
            result.add(info
            );
            info.setMenu(menu.getTitle());
        }
    }

    public List<PermissionInfo> getPermissionByUsername(String username) {
        User user = userBiz.getUserByUsername(username);
        List<Menu> menus = menuBiz.getUserAuthorityMenuByUserId(user.getId());
        List<PermissionInfo> result = new ArrayList<PermissionInfo>();
        PermissionInfo info = null;
        menu2permission(menus, result);
        List<Element> elements = elementBiz.getAuthorityElementByUserId(user.getId() + "");
        element2permission(result, elements);
        return result;
    }

    private void element2permission(List<PermissionInfo> result, List<Element> elements) {
        PermissionInfo info;
        for (Element element : elements) {
            info = new PermissionInfo();
            info.setCode(element.getCode());
            info.setType(element.getType());
            info.setUri(element.getUri());
            info.setMethod(element.getMethod());
            info.setName(element.getName());
            info.setMenu(element.getMenuId());
            result.add(info);
        }
    }


    private List<MenuTree> getMenuTree(List<Menu> menus, int root) {
        List<MenuTree> trees = new ArrayList<MenuTree>();
        MenuTree node = null;
        for (Menu menu : menus) {
            node = new MenuTree();
            BeanUtils.copyProperties(menu, node);
            trees.add(node);
        }
        return TreeUtil.bulid(trees, root);
    }

    public FrontUser getUserInfo(String token) throws Exception {
        String username = userAuthUtil.getInfoFromToken(token).getUniqueName();
        if (username == null) {
            return null;
        }
        UserInfo user = this.getUserByUsername(username);
        FrontUser frontUser = new FrontUser();
        BeanUtils.copyProperties(user, frontUser);
        List<PermissionInfo> permissionInfos = this.getPermissionByUsername(username);
        Stream<PermissionInfo> menus = permissionInfos.parallelStream().filter((permission) -> {
            return permission.getType().equals(CommonConstants.RESOURCE_TYPE_MENU);
        });
        frontUser.setMenus(menus.collect(Collectors.toList()));
        Stream<PermissionInfo> elements = permissionInfos.parallelStream().filter((permission) -> {
            return !permission.getType().equals(CommonConstants.RESOURCE_TYPE_MENU);
        });
        frontUser.setElements(elements.collect(Collectors.toList()));
        return frontUser;
    }

    public List<MenuTree> getMenusByUsername(String token) throws Exception {
        String username = userAuthUtil.getInfoFromToken(token).getUniqueName();
        if (username == null) {
            return null;
        }
        User user = userBiz.getUserByUsername(username);
        List<Menu> menus = menuBiz.getUserAuthorityMenuByUserId(user.getId());
        return getMenuTree(menus,AdminCommonConstant.ROOT);
    }
}
