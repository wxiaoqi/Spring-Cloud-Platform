package com.github.wxiaoqi.security.gate.filter;

import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
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

import javax.servlet.http.HttpSession;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-23 8:25
 */
@Component
public class SessionAccessFilter extends ZuulFilter {
  @Autowired
  private SessionRepository<?> repository;

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
    return null;
  }
}
