package com.github.wxiaoqi.security.api.gate.rpc;

import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.gate.ClientInfo;

import java.util.List;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-07-02 19:23
 */
@FeignClient("admin-back")
public interface IGateService {
	@RequestMapping(value = "/gate/client/{clientId}", method = RequestMethod.GET)
	public ClientInfo getGateClientInfo(@PathVariable("clientId") String clientId);

	@RequestMapping(value = "/gate/services", method = RequestMethod.GET)
	public List<PermissionInfo> getGateServiceInfo();

	@RequestMapping(value = "/gate/services/{clientId}", method = RequestMethod.GET)
	public List<PermissionInfo> getGateServiceInfo(@PathVariable("clientId") String clientId);
}
