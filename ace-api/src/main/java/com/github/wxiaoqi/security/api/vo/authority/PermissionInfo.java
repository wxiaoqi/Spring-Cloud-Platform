package com.github.wxiaoqi.security.api.vo.authority;

import java.io.Serializable;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-22 15:19
 */
public class PermissionInfo implements Serializable{
    private String code;
    private String type;
    private String uri;
    private String method;

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }
}
