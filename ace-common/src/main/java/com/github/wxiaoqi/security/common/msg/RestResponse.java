package com.github.wxiaoqi.security.common.msg;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-09 7:32
 */
public class RestResponse<T> {
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



  boolean rel;
  String msg;
  T result;
  int count;
  public int getCount() {
    return count;
  }

  public void setCount(int count) {
    this.count = count;
  }
  public RestResponse count(int count){
    this.setCount(count);
    return this;
  }
  public RestResponse rel(boolean rel) {
    this.setRel(rel);
    return this;
  }

  public RestResponse msg(String msg) {
    this.setMsg(msg);
    return this;
  }

  public RestResponse result(T result) {
    this.setResult(result);
    return this;
  }
}
