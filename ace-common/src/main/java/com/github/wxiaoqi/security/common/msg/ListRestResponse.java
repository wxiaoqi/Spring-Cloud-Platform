package com.github.wxiaoqi.security.common.msg;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-09 7:32
 */
public class ListRestResponse<T> {
    boolean rel;
    String msg;
    T result;
    int count;
    String callback;

    public String getCallback() {
        return callback;
    }

    public void setCallback(String callback) {
        this.callback = callback;
    }

    public boolean isRel() {
        return rel;
    }

    public void setRel(boolean rel) {
        this.rel = rel;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getResult() {
        return result;
    }

    public void setResult(T result) {
        this.result = result;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public ListRestResponse count(int count) {
        this.setCount(count);
        return this;
    }

    public ListRestResponse count(Long count) {
        this.setCount(count.intValue());
        return this;
    }

    public ListRestResponse rel(boolean rel) {
        this.setRel(rel);
        return this;
    }

    public ListRestResponse msg(String msg) {
        this.setMsg(msg);
        return this;
    }

    public ListRestResponse result(T result) {
        this.setResult(result);
        return this;
    }

}
