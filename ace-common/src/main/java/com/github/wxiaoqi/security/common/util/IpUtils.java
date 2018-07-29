package com.github.wxiaoqi.security.common.util;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * 根据HttpServletRequest获取IP的辅助类
 *
 * @author malcolm.shen@qq.com
 * @date：2018/7/27 17:23
 */
public class IpUtils {
	private static final String HTTP_HEADER_CDN_SRC_IP = "Cdn-Src-Ip";
	private static final String[] HTTP_HEADER_IP_ADDRESS = { "x-forwarded-for", "Proxy-Client-IP", "WL-Proxy-Client-IP" };
	private static final String[] HTTP_HEADER_IP_ADDRESS_ALL = (String[]) ArrayUtils.addAll(
			new String[] { HTTP_HEADER_CDN_SRC_IP }, HTTP_HEADER_IP_ADDRESS);

	public static String getCdnSrcIp(HttpServletRequest request) {
		return (null == request) ? null : request.getHeader(HTTP_HEADER_CDN_SRC_IP);
	}

	/**
	 * No CDN logic for IP address.
	 */
	public static String getNormalClientIp(HttpServletRequest request) {
		return getIpAddress(request, HTTP_HEADER_IP_ADDRESS, false);
	}

	public static String getClientRealIp(HttpServletRequest request) {
		return getIpAddress(request, HTTP_HEADER_IP_ADDRESS_ALL, false);
	}

    public static String getFullClientIp(HttpServletRequest request) {
        return getIpAddress(request, HTTP_HEADER_IP_ADDRESS_ALL, true);
    }

	private static String getIpAddress(HttpServletRequest request, String[] ipHeaders, boolean keepProxyIp) {
		if (null == request || ipHeaders == null) {
			return null;
		}

		String ip = null;

		for (String key : ipHeaders) {
			ip = request.getHeader(key);
			if (StringUtils.isNotBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
				break;
			}
		}
		// default
		if (StringUtils.isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		    
		return getIp(ip, keepProxyIp);
	}

	private static String getIp(String ipString, boolean keepProxyIp) {
	    if (StringUtils.isNotBlank(ipString)) {
	        if (keepProxyIp) {
	            return ipString.trim();
	        } else {
	            String[] ips = ipString.split(",");
	            for (String ip : ips) {
	                if (StringUtils.isNotBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
	                    return ip.trim();
	                }
	            }
	            return "";
	        }
	    } else {
	        return "";
	    }
	}
}
