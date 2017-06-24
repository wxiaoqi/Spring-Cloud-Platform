package com.github.wxiaoqi.security.ui.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.github.wxiaoqi.security.ui.rpc.IUserService;
import com.google.common.base.Predicate;
import com.google.common.collect.Collections2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.util.Base64Utils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
  private IUserService userService;

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
    log.debug("uri：" + requestUri + "----method：" + method);
    if("/index".equals(requestUri)||"/about".equals(requestUri)){
        return true;
    }
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
            return requestUri.startsWith(permissionInfo.getUri())
                && method.equals(permissionInfo.getMethod());
          }
        });
    if (result.size() > 0)
      return true;
    else {
      response.getWriter().println("<h1>403 Forbidden!</>");
      return false;
    }
  }

  /**
   * 在业务处理器处理请求执行完成后,生成视图之前执行的动作 可在modelAndView中加入数据，比如当前时间
   */
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
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
}
