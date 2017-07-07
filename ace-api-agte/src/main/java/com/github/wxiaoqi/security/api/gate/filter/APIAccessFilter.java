package com.github.wxiaoqi.security.api.gate.filter;

import com.github.wxiaoqi.security.api.gate.rpc.GateService;
import com.github.wxiaoqi.security.api.gate.secruity.JwtTokenUtil;
import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.google.common.base.Predicate;
import com.google.common.collect.Collections2;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;

import lombok.extern.slf4j.Slf4j;

import java.util.Collection;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-29 8:44
 */
//@Component
@Slf4j
public class APIAccessFilter extends ZuulFilter {
	@Autowired
	private GateService gateService;
	@Autowired
	private JwtTokenUtil jwtTokenUtil;
	@Value("${jwt.header}")
	private String tokenHeader;
	@Value("${jwt.tokenHead}")
	private String tokenHead;

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
		Collection<PermissionInfo> permissionInfos = gateService.getGateServiceInfo();
		Collection<PermissionInfo> result = Collections2.filter(permissionInfos, new Predicate<PermissionInfo>() {
			@Override
			public boolean apply(PermissionInfo permissionInfo) {
				String url = permissionInfo.getUri();
				String uri = url.replaceAll("\\{\\*\\}", "[a-zA-Z\\\\d]+");
				String regEx = "^" + uri + "$";
				return (Pattern.compile(regEx).matcher(requestUri).find() || requestUri.startsWith(url + "/"))
						&& method.equals(permissionInfo.getMethod());
			}
		});
		if (result.size() <= 0) {
			return null;
		} else {
			String authHeader = request.getHeader(this.tokenHeader);
			if (authHeader != null && authHeader.startsWith(tokenHead)) {
				final String authToken = authHeader.substring(tokenHead.length()); // The part after "Bearer "
				String clientId = jwtTokenUtil.getClientIdFromToken(authToken);
				List<PermissionInfo> clientPermissionInfo = gateService.getGateServiceInfo(clientId);
				result = Collections2.filter(clientPermissionInfo, new Predicate<PermissionInfo>() {
					@Override
					public boolean apply(PermissionInfo permissionInfo) {
						String url = permissionInfo.getUri();
						String uri = url.replaceAll("\\{\\*\\}", "[a-zA-Z\\\\d]+");
						String regEx = "^" + uri + "$";
						return (Pattern.compile(regEx).matcher(requestUri).find() || requestUri.startsWith(url + "/"))
								&& method.equals(permissionInfo.getMethod());
					}
				});
				if (result.size() <= 0) {
					setFailedRequest("403 Forbidden!", 403);
				}
			}else {
				setFailedRequest("403 Forbidden!", 403);
			}
			return null;
		}
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
			throw new RuntimeException("Code: " + code + ", " + body); // optional
		}
	}


}
