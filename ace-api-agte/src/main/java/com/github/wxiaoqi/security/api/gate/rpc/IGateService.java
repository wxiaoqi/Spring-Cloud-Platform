package com.github.wxiaoqi.security.api.gate.rpc;

import com.github.wxiaoqi.security.api.vo.gate.ClientInfo;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-07-02 19:23
 */
@FeignClient("admin-back")
@RequestMapping("api")
public interface IGateService {
  @RequestMapping(value = "/gate/client/{clientId}", method = RequestMethod.GET)
  public ClientInfo getGateClientInfo(@PathVariable("clientId") String clientId);
}
