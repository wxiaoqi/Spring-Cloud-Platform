package com.github.wxiaoqi.security.common.msg;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-10 7:20
 */
public class ListRestResponse<T>  extends RestResponse{
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    public ListRestResponse count(int count){
        this.setCount(count);
        return this;
    }

    int count;

}
