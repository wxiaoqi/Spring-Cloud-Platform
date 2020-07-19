package com.github.wxiaoqi.security.common.msg;

/**
 * Created by Ace on 2017/6/11.
 */
public class ObjectRestResponse<T> extends BaseResponse {

    T data;
    
    public ObjectRestResponse data(T data) {
        this.setData(data);
        return this;
    }
    public T getData() {
        return data;
    }

    public ObjectRestResponse setData(T data) {
        this.data = data;
        return this;
    }


}
