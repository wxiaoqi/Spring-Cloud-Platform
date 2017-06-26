package com.github.wxiaoqi.security.gate.filter;

import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.github.wxiaoqi.security.gate.rpc.IUserService;
import com.google.common.base.Predicate;
import com.google.common.collect.Collections2;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.session.Session;
import org.springframework.session.SessionRepository;
import org.springframework.stereotype.Component;
import org.springframework.util.Base64Utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.List;
import java.util.regex.Pattern;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-23 8:25
 */
@Component
public class SessionAccessFilter extends ZuulFilter {
  private final Logger log = LoggerFactory.getLogger(SessionAccessFilter.class);

  @Autowired
  private SessionRepository<?> repository;
  @Autowired
  private IUserService userService;

  @Override
  public String filterType() {
    return "pre";
  }

  @Override
  public int filterOrder() {
    return 1;
  }

  @Override
  public boolean shouldFilter() {
    return true;
  }

  @Override
  public Object run() {
    RequestContext ctx = RequestContext.getCurrentContext();
    HttpSession httpSession = ctx.getRequest().getSession();
    Session session = repository.getSession(httpSession.getId());
    SecurityContextImpl securityContextImpl =
        (SecurityContextImpl) httpSession.getAttribute("SPRING_SECURITY_CONTEXT");
    User user = (User) securityContextImpl.getAuthentication().getPrincipal();
    ctx.addZuulRequestHeader("Authorization",
        Base64Utils.encodeToString(user.getUsername().getBytes()));
    HttpServletRequest request = ctx.getRequest();
    final String requestUri = request.getRequestURI();
    final String method = request.getMethod();
    if(requestUri.contains(".")||requestUri.startsWith("/service")||requestUri.startsWith("/back/menu/user")||requestUri.startsWith("/admin/index")||requestUri.startsWith("/admin/about"))
      return null;
    log.info("uri：" + requestUri + "----method：" + method);
    String username = user.getUsername();
    List<PermissionInfo> permissionInfos = null;
    if (request.getSession().getAttribute("permission") == null) {
      UserInfo userInfo = userService.getUserByUsername(username);
      permissionInfos = userService.getPermissionByUserId(userInfo.getId());
      request.getSession().setAttribute("permission", permissionInfos);
    } else {
      permissionInfos = (List<PermissionInfo>) request.getSession().getAttribute("permission");
    }
    Collection<PermissionInfo> result =
            Collections2.filter(permissionInfos, new Predicate<PermissionInfo>() {
              @Override
              public boolean apply(PermissionInfo permissionInfo) {
                String url = permissionInfo.getUri();
                String uri = url.replaceAll("\\{\\*\\}", "[a-zA-Z\\\\d]+");
                String regEx = "^" + uri + "$";
                return (Pattern.compile(regEx).matcher(requestUri).find() || requestUri.startsWith(url+"/"))
                        && method.equals(permissionInfo.getMethod());
              }
            });
    if (result.size() <= 0){
      setFailedRequest("<h1>Forbidden!</h1>",403);
    }
    return null;
  }

  /**
   * Reports an error message given a response body and code.
   *
   * @param body
   * @param code
   */
  private void setFailedRequest(String body, int code) {
    log.debug("Reporting error ({}): {}", code, body);
    RequestContext ctx = RequestContext.getCurrentContext();
    ctx.setResponseStatusCode(code);
    if (ctx.getResponseBody() == null) {
      ctx.setResponseBody(body);
      ctx.setSendZuulResponse(false);
      throw new RuntimeException("Code: " + code + ", " + body); //optional
    }
  }
}
