package com.github.wxiaoqi.security.modules.admin.rpc.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.wxiaoqi.security.api.vo.authority.CheckPermissionInfo;
import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.github.wxiaoqi.security.common.constant.CommonConstants;
import com.github.wxiaoqi.security.common.context.BaseContextHandler;
import com.github.wxiaoqi.security.common.util.TreeUtil;
import com.github.wxiaoqi.security.modules.admin.biz.ElementBiz;
import com.github.wxiaoqi.security.modules.admin.biz.MenuBiz;
import com.github.wxiaoqi.security.modules.admin.biz.UserBiz;
import com.github.wxiaoqi.security.modules.admin.constant.AdminCommonConstant;
import com.github.wxiaoqi.security.common.constant.RedisKeyConstant;
import com.github.wxiaoqi.security.modules.admin.entity.Element;
import com.github.wxiaoqi.security.modules.admin.entity.Menu;
import com.github.wxiaoqi.security.modules.admin.entity.User;
import com.github.wxiaoqi.security.modules.admin.util.Sha256PasswordEncoder;
import com.github.wxiaoqi.security.modules.admin.vo.*;
import com.github.wxiaoqi.security.modules.auth.util.user.JwtTokenUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
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
    private JwtTokenUtil userAuthUtil;
    private Sha256PasswordEncoder encoder = new Sha256PasswordEncoder();

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    public UserInfo getUserByUsername(String username) {
        UserInfo info = new UserInfo();
        User user = userBiz.getUserByUsername(username);
        BeanUtils.copyProperties(user, info);
        info.setId(user.getId().toString());
        return info;
    }

    public UserInfo validate(String username, String password) {
        UserInfo info = new UserInfo();
        User user = userBiz.getUserByUsername(username);
        if (encoder.matches(password, user.getPassword())) {
            BeanUtils.copyProperties(user, info);
            info.setId(user.getId().toString());
        }
        return info;
    }

    public List<PermissionInfo> getAllPermission() {
        String key = RedisKeyConstant.REDIS_KEY_ALL_PERMISISON;
        String s = stringRedisTemplate.opsForValue().get(key);
        if (s == null || org.apache.commons.lang.StringUtils.isBlank(s)) {
            List<Menu> menus = menuBiz.selectListAll();
            List<PermissionInfo> result = new ArrayList<PermissionInfo>();
            menu2permission(menus, result);
            List<Element> elements = elementBiz.getAllElementPermissions();
            element2permission(result, elements);
            s = JSON.toJSONString(result);
            stringRedisTemplate.opsForValue().set(key, s, 12, TimeUnit.HOURS);
        }
        List<PermissionInfo> permissionInfos = JSON.parseArray(s, PermissionInfo.class);
        return permissionInfos;
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
        String key = String.format(RedisKeyConstant.REDIS_KEY_USER_PERMISISON, username);
        String s = stringRedisTemplate.opsForValue().get(key);
        if (s == null || org.apache.commons.lang.StringUtils.isBlank(s)) {
            User user = userBiz.getUserByUsername(username);
            List<Menu> menus = menuBiz.getUserAuthorityMenuByUserId(user.getId());
            List<PermissionInfo> result = new ArrayList<PermissionInfo>();
            menu2permission(menus, result);
            List<Element> elements = elementBiz.getAuthorityElementByUserId(user.getId() + "");
            element2permission(result, elements);
            stringRedisTemplate.opsForValue().set(key, JSON.toJSONString(result), 12, TimeUnit.HOURS);

            return result;
        }
        List<PermissionInfo> permissionInfos = JSON.parseArray(s, PermissionInfo.class);
        return permissionInfos;
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

    public FrontUserV2 getUserInfoV2() {
        String username = BaseContextHandler.getUsername();
        if (username == null) {
            return null;
        }
        User user = userBiz.getUserByUsername(username);
        FrontUserV2 frontUser = new FrontUserV2();
        List<Menu> menus = menuBiz.getUserAuthorityMenuByUserId(user.getId());
        List<AccessMenuTree> menuTrees = new ArrayList<AccessMenuTree>();
        List<AccessRouteTree> routeTrees = new ArrayList<>();
        AccessMenuTree node = null;
        AccessRouteTree routeNode = null;
        List<Integer> menuIds = new ArrayList<>();
        List<AccessMenuTree> header = new ArrayList<>();
        // 设置菜单树
        for (Menu menu : menus) {
            node = new AccessMenuTree();
            node.setIcon(menu.getIcon());
            node.setPath(menu.getHref());
            node.setTitle(menu.getTitle());
            node.setId(menu.getId());
            node.setParentId(menu.getParentId());
            menuTrees.add(node);
            // 设置系统头部菜单
            if (menu.getParentId().equals(AdminCommonConstant.ROOT)) {
                menuIds.add(menu.getId());
                node = new AccessMenuTree();
                node.setIcon(menu.getIcon());
                node.setPath(menu.getHref());
                node.setTitle(menu.getTitle());
                node.setId(menu.getId());
                node.setParentId(menu.getParentId());
                header.add(node);
                continue;
            }
            routeNode = new AccessRouteTree();
            routeNode.setIcon(menu.getIcon());
            routeNode.setId(menu.getId());
            routeNode.setPath(menu.getHref());
            routeNode.setParentId(menu.getParentId());
            routeNode.setName(menu.getCode());
            routeNode.setComponent(menu.getAttr3());
            routeNode.setComponentPath(menu.getAttr1());
            JSONObject jsonObject = JSONObject.parseObject(menu.getAttr2());
            jsonObject.put("title", menu.getTitle());
            routeNode.setMeta(jsonObject);
            routeTrees.add(routeNode);
        }
        // 配置页面资源权限
        List<Element> elements = elementBiz.getAuthorityElementByUserId(user.getId() + "");
        List<String> permissions = new ArrayList<>();
        List<AccessInterface> interfaces = new ArrayList<>();
        AccessInterface accessInterface = null;
        for (Element element : elements) {
            accessInterface = new AccessInterface();
            permissions.add(element.getCode());
            accessInterface.setMethod(element.getMethod());
            accessInterface.setPath(element.getUri());
            interfaces.add(accessInterface);
        }
        // 配置路由权限
        List<AccessRouteTree> accessRoutes = new ArrayList<>();
        for (Integer menuId : menuIds) {
            accessRoutes.addAll(TreeUtil.bulid(routeTrees, menuId));
        }
        frontUser.setAccessMenus(TreeUtil.bulid(menuTrees, AdminCommonConstant.ROOT));
        frontUser.setAccessHeader(header);
        frontUser.setAccessRoutes(accessRoutes);
        frontUser.setUserPermissions(permissions);
        frontUser.setUserName(user.getName());
        frontUser.setAccessInterfaces(interfaces);
        //TODO 待接入头像附件上传服务
        frontUser.setAvatarUrl("https://api.adorable.io/avatars/85/abott@adorable.png");
        return frontUser;
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
        return getMenuTree(menus, AdminCommonConstant.ROOT);
    }

    public Mono<CheckPermissionInfo> checkUserPermission(String username, String requestUri, String requestMethod) {
        CheckPermissionInfo checkPermissionInfo = new CheckPermissionInfo();
        List<PermissionInfo> allPermission = this.getAllPermission();
        // 判断当前访问资源是否有权限控制
        List<PermissionInfo> matchPermission = allPermission.parallelStream().filter(permissionInfo -> {
            String uri = permissionInfo.getUri();
            if (uri.indexOf("{") > 0) {
                uri = uri.replaceAll("\\{\\*\\}", "[a-zA-Z\\\\d]+");
            }
            String regEx = "^" + uri + "$";
            return (Pattern.compile(regEx).matcher(requestUri).find())
                    && requestMethod.equals(permissionInfo.getMethod());
        }).collect(Collectors.toList());
        // 说明当前访问资源不做权限控制
        if (matchPermission.size() == 0) {
            checkPermissionInfo.setIsAuth(true);
            return Mono.just(checkPermissionInfo);
        }
        // 判断当前用户是否拥有该访问资源的权限
        List<PermissionInfo> permissions = this.getPermissionByUsername(username);
        PermissionInfo current = null;
        for (PermissionInfo info : permissions) {
            boolean anyMatch = matchPermission.parallelStream().anyMatch(permissionInfo -> permissionInfo.getCode().equals(info.getCode()));
            if (anyMatch) {
                current = info;
                break;
            }
        }
        if (current == null) {
            // 当前用户不拥有该权限
            checkPermissionInfo.setIsAuth(false);
        } else {
            // 当前用户拥有该资源的访问权限
            checkPermissionInfo.setIsAuth(true);
            checkPermissionInfo.setPermissionInfo(current);
        }
        return Mono.just(checkPermissionInfo);
    }
}
