package com.github.wxiaoqi.security.gate.service;

import com.github.wxiaoqi.security.api.vo.log.LogInfo;

/**
 * @author Ths Sun
 * @create 2020/7/23.
 */
public interface LogService {
    void saveLog(LogInfo info);
}
