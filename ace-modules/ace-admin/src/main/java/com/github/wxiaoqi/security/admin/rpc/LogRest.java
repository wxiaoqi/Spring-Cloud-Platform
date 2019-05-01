package com.github.wxiaoqi.security.admin.rpc;

import com.github.wxiaoqi.security.admin.biz.GateLogBiz;
import com.github.wxiaoqi.security.admin.entity.GateLog;
import com.github.wxiaoqi.security.api.vo.log.LogInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-07-01 14:39
 */
@RequestMapping("api")
@RestController
public class LogRest {
    @Autowired
    private GateLogBiz gateLogBiz;
    @RequestMapping(value="/log/save",method = RequestMethod.POST)
    public @ResponseBody void saveLog(@RequestBody LogInfo info){
        GateLog log = new GateLog();
        BeanUtils.copyProperties(info,log);
        log.setCrtTime(new Date(info.getCrtTime()));
        gateLogBiz.insertSelective(log);
    }
}
