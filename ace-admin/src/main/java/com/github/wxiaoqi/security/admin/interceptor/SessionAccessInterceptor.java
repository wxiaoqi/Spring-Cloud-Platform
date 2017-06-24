package com.github.wxiaoqi.security.admin.interceptor;

import java.util.Collection;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.wxiaoqi.security.admin.rpc.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Base64Utils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.google.common.base.Predicate;
import com.google.common.collect.Collections2;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-24 18:01
 */
public class SessionAccessInterceptor extends HandlerInterceptorAdapter {
  private final Logger log = LoggerFactory.getLogger(SessionAccessInterceptor.class);
  public static final String LAST_PAGE = "com.alibaba.lastPage";
  @Autowired
  private UserService userService;

  /*
   * 利用正则映射到需要拦截的路径
   * 
   * private String mappingURL;
   * 
   * public void setMappingURL(String mappingURL) { this.mappingURL = mappingURL; }
   */
  /**
   * 在业务处理器处理请求之前被调用 如果返回false 从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链 如果返回true
   * 执行下一个拦截器,直到所有的拦截器都执行完毕 再执行被拦截的Controller 然后进入拦截器链, 从最后一个拦截器往回执行所有的postHandle()
   * 接着再从最后一个拦截器往回执行所有的afterCompletion()
   */
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    log.debug("==============执行顺序: 1、preHandle================");
    final String requestUri = request.getRequestURI();
    final String method = request.getMethod();
    //TODO 回头迁移至ace-ui
    if(requestUri.startsWith("/service")||requestUri.startsWith("/menu/user"))
      return true;
    log.debug("uri：" + requestUri + "----method：" + method);
    String authorization = request.getHeader("Authorization");
    String username = new String(Base64Utils.decodeFromString(authorization));
    List<PermissionInfo> permissionInfos = null;
    if (request.getSession().getAttribute("permission") == null) {
      UserInfo userInfo = userService.getUserByUsername(username);
      permissionInfos = userService.getPermissionByUserId(userInfo.getId());
      request.getSession().setAttribute("permission", permissionInfos);
    } else {
      permissionInfos = (List<PermissionInfo>) request.getAttribute("permission");
    }
    Collection<PermissionInfo> result =
        Collections2.filter(permissionInfos, new Predicate<PermissionInfo>() {
          @Override
          public boolean apply(PermissionInfo permissionInfo) {
            String url = permissionInfo.getUri();
            String uri = url.replaceAll("\\{\\*\\}", "[a-zA-Z\\\\d]+");
            String regEx = "^"+uri+"$";
            return (Pattern.compile(regEx).matcher(requestUri).find()||requestUri.startsWith(url) )
                && method.equals(permissionInfo.getMethod());
          }
        });
    if (result.size() > 0)
      return true;
    else {
      response.setStatus(403);
      return false;
    }
  }

  /**
   * 在业务处理器处理请求执行完成后,生成视图之前执行的动作 可在modelAndView中加入数据，比如当前时间
   */
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    if (modelAndView != null) { // 加入当前时间
      modelAndView.addObject("var", "测试postHandle");
    }
  }

  /**
   * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等
   *
   * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()
   */
  @Override
  public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
      Object handler, Exception ex) throws Exception {
  }

  /**
   * @param regex
   * 正则表达式字符串
   * @param str
   * 要匹配的字符串
   * @return 如果str 符合 regex的正则表达式格式,返回true, 否则返回 false;
   */
  private static boolean match(String regex, String str) {
    Pattern pattern = Pattern.compile(regex);
    Matcher matcher = pattern.matcher(str);
    return matcher.find();
  }
}
