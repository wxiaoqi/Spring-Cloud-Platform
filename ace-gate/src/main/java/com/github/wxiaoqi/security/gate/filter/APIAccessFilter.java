package com.github.wxiaoqi.security.gate.filter;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-29 8:44
 */
public class APIAccessFilter extends ZuulFilter {
    @Override
    public String filterType() {
        return "pre";
    }

    @Override
    public int filterOrder() {
        return 2;
    }

    @Override
    public boolean shouldFilter() {
        return true;
    }

    @Override
    public Object run() {
        RequestContext ctx = RequestContext.getCurrentContext();
        HttpServletRequest request = ctx.getRequest();
        final String requestUri = request.getRequestURI();
        final String method = request.getMethod();
        // 获取鉴权token
        // 根据token表中获取clientId
        // 校验client 可以访问的资源
        // 无匹配资源则抛出返回结果
        return null;
    }
    // 1、客户端注册
    // 2、服务自动注册（从swagger ui中提取）
    // 3、客户端服务授权
    // 1、客户端合法性校验 clientId、secret => token   redis 有效期
    // 2、URI合法校验 token => clientId + permission
}
