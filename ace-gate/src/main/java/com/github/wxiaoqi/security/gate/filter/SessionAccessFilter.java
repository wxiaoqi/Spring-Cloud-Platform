package com.github.wxiaoqi.security.gate.filter;

import com.alibaba.fastjson.JSON;
import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.log.LogInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;
import com.github.wxiaoqi.security.common.msg.auth.TokenErrorResponse;
import com.github.wxiaoqi.security.common.util.ClientUtil;
import com.github.wxiaoqi.security.gate.jwt.JwtTokenUtil;
import com.github.wxiaoqi.security.gate.rpc.ILogService;
import com.github.wxiaoqi.security.gate.rpc.IUserService;
import com.github.wxiaoqi.security.gate.utils.DBLog;
import com.google.common.base.Predicate;
import com.google.common.collect.Collections2;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.Base64Utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.*;
import java.util.regex.Pattern;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-23 8:25
 */
@Component
@Slf4j
public class SessionAccessFilter extends ZuulFilter {

    @Autowired
    private IUserService userService;
    @Autowired
    private ILogService logService;

    @Value("${gate.ignore.startWith}")
    private String startWith;
    @Value("${gate.ignore.contain}")
    private String contain;
    @Value("${gate.oauth.prefix}")
    private String oauthPrefix;
    @Value("${gate.jwt.header}")
    private String tokenHeader;
    @Value("${zuul.prefix}")
    private String zuulPrefix;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    public SessionAccessFilter() {
        super();
    }

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
        HttpServletRequest request = ctx.getRequest();
        final String requestUri = request.getRequestURI().substring(zuulPrefix.length());
        final String method = request.getMethod();
        // 不进行拦截的地址
        if (isStartWith(requestUri) || isContains(requestUri)|| isOAuth(requestUri))
            return null;
        UserInfo user = getJWTUser(request);
        String username = null;
        if(user!=null) {
             username = user.getUsername();
            // 设置头部校验信息
            ctx.addZuulRequestHeader("Authorization",
                    Base64Utils.encodeToString(user.getUsername().getBytes()));
            // 查找合法链接
        } else
            setFailedRequest(JSON.toJSONString(new TokenErrorResponse("Token Forbidden!")), 200);
        List<PermissionInfo> permissionInfos = userService.getAllPermissionInfo();
        // 判断资源是否启用权限约束
        Collection<PermissionInfo> result = getPermissionInfos(requestUri, method, permissionInfos);
        if(result.size()>0){
            if(username!=null)
                checkAllow(requestUri, method, ctx, username);

        }
        return null;
    }

    /**
     * 获取目标权限资源
     * @param requestUri
     * @param method
     * @param serviceInfo
     * @return
     */
    private Collection<PermissionInfo> getPermissionInfos(final String requestUri, final String method, List<PermissionInfo> serviceInfo) {
        return Collections2.filter(serviceInfo, new Predicate<PermissionInfo>() {
                @Override
                public boolean apply(PermissionInfo permissionInfo) {
                    String url = permissionInfo.getUri();
                    String uri = url.replaceAll("\\{\\*\\}", "[a-zA-Z\\\\d]+");
                    String regEx = "^" + uri + "$";
                    return (Pattern.compile(regEx).matcher(requestUri).find() || requestUri.startsWith(url + "/"))
                            && method.equals(permissionInfo.getMethod());
                }
            });
    }

    private void setCurrentUserInfoAndLog(RequestContext ctx, String username, PermissionInfo pm) {
        UserInfo info = userService.getUserByUsername(username);
        String host =  ClientUtil.getClientIp(ctx.getRequest());
        ctx.addZuulRequestHeader("userId", info.getId());
        ctx.addZuulRequestHeader("userName", URLEncoder.encode(info.getName()));
        ctx.addZuulRequestHeader("userHost", ClientUtil.getClientIp(ctx.getRequest()));
        LogInfo logInfo = new LogInfo(pm.getMenu(),pm.getName(),pm.getUri(),new Date(),info.getId(),info.getName(),host);
        DBLog.getInstance().setLogService(logService).offerQueue(logInfo);
    }

    /**
     * 判定是否oauth资源
     * @param requestUri
     * @return
     */
    private boolean isOAuth(String requestUri) {
        return requestUri.startsWith(oauthPrefix);
    }

    /**
     * 返回session中的用户信息
     * @param request
     * @return
     */
    private UserInfo getJWTUser(HttpServletRequest request) {
        String authToken = request.getHeader(this.tokenHeader);
        if (authToken != null) {
            String username = jwtTokenUtil.getUsernameFromToken(authToken);
            log.info("checking authentication " + username);
            if (username != null ) {
                UserInfo userDetails = userService.getUserByUsername(username);
                if (jwtTokenUtil.validateToken(authToken, userDetails)) {
                    return userDetails;
                }
            }
            setFailedRequest(JSON.toJSONString(new TokenErrorResponse("Token Error or Token Expired!")),200);
            return null;
        }else{
            return null;
        }
    }

    /**
     * 读取权限
     * @param request
     * @param username
     * @return
     */
    private List<PermissionInfo> getPermissionInfos(HttpServletRequest request, String username) {
        List<PermissionInfo> permissionInfos;
        if (request.getSession().getAttribute("permission") == null) {
            permissionInfos = userService.getPermissionByUsername(username);
            request.getSession().setAttribute("permission", permissionInfos);
        } else {
            permissionInfos = (List<PermissionInfo>) request.getSession().getAttribute("permission");
        }
        return permissionInfos;
    }

    /**
     * 权限校验
     * @param requestUri
     * @param method
     */
    private void checkAllow(final String requestUri, final String method ,RequestContext ctx,String username) {
        log.debug("uri：" + requestUri + "----method：" + method);
        List<PermissionInfo> permissionInfos = getPermissionInfos(ctx.getRequest(), username) ;
        Collection<PermissionInfo> result = getPermissionInfos(requestUri, method, permissionInfos);
        if (result.size() <= 0) {
            setFailedRequest(JSON.toJSONString(new TokenErrorResponse("Token Forbidden!")), 200);
        } else{
            PermissionInfo[] pms =  result.toArray(new PermissionInfo[]{});
            PermissionInfo pm = pms[0];
            if(!method.equals("GET")){
                setCurrentUserInfoAndLog(ctx, username, pm);
            }
        }
    }

    /**
     * 是否包含某种特征
     * @param requestUri
     * @return
     */
    private boolean isContains(String requestUri) {
        boolean flag = false;
        for (String s : contain.split(",")) {
            if (requestUri.contains(s))
                return true;
        }
        return flag;
    }

    /**
     * URI是否以什么打头
     * @param requestUri
     * @return
     */
    private boolean isStartWith(String requestUri) {
        boolean flag = false;
        for (String s : startWith.split(",")) {
            if (requestUri.startsWith(s))
                return true;
        }
        return flag;
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
