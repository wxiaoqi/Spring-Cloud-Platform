package com.github.wxiaoqi.security.api.gate.rpc;

import com.github.wxiaoqi.security.api.gate.biz.ElementBiz;
import com.github.wxiaoqi.security.api.gate.biz.GateClientBiz;
import com.github.wxiaoqi.security.api.gate.constant.CommonConstant;
import com.github.wxiaoqi.security.api.gate.entity.Element;
import com.github.wxiaoqi.security.api.gate.entity.GateClient;
import com.github.wxiaoqi.security.api.vo.authority.PermissionInfo;
import com.github.wxiaoqi.security.api.vo.gate.ClientInfo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tk.mybatis.mapper.entity.Example;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-07-02 19:23
 */
@Service
public class GateService {
	@Autowired
	private GateClientBiz gateClientBiz;
	@Autowired
	private ElementBiz elmentBiz;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);

	public ClientInfo getGateClientInfo(String clientId) {
		Example example = new Example(GateClient.class);
		example.createCriteria().andEqualTo("code", clientId);
		ClientInfo info = new ClientInfo();
		GateClient gateClient = gateClientBiz.selectByExample(example).get(0);
		BeanUtils.copyProperties(gateClient, info);
		info.setLocked(CommonConstant.BOOLEAN_NUMBER_TRUE.equals(gateClient.getLocked()));
//		info.setSecret(encoder.encode(info.getSecret()));
		return info;
	}

	public List<PermissionInfo> getGateServiceInfo() {
		List<PermissionInfo> infos = new ArrayList<PermissionInfo>();
		Example example = new Example(Element.class);
		example.createCriteria().andEqualTo("menuId", "-1");
		List<Element> elements = elmentBiz.selectByExample(example);
		convert(infos, elements);
		return infos;
	}

	public List<PermissionInfo> getGateServiceInfo(String clientId) {
		GateClient gateClient = new GateClient();
		gateClient.setCode(clientId);
		gateClient = gateClientBiz.selectOne(gateClient);
		List<PermissionInfo> infos = new ArrayList<PermissionInfo>();
		List<Element> elements = gateClientBiz.getClientServices(gateClient.getId());
		convert(infos, elements);
		return infos;
	}

	private void convert(List<PermissionInfo> infos, List<Element> elements) {
		PermissionInfo info;
		for (Element element : elements) {
			info = new PermissionInfo();
			info.setCode(element.getCode());
			info.setType(element.getType());
			info.setUri(element.getUri());
			info.setMethod(element.getMethod());
			info.setName(element.getName());
			infos.add(info);
		}
	}
}
