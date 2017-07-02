package com.github.wxiaoqi.security.admin.rpc;

import com.github.wxiaoqi.security.admin.biz.GateClientBiz;
import com.github.wxiaoqi.security.admin.constant.CommonConstant;
import com.github.wxiaoqi.security.admin.entity.GateClient;
import com.github.wxiaoqi.security.api.vo.gate.ClientInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-07-02 18:08
 */
@RequestMapping("api")
@Controller
public class GateService {
  @Autowired
  private GateClientBiz gateClientBiz;

  @RequestMapping(value = "/gate/client/{clientId}", method = RequestMethod.GET)
  @ResponseBody
  public ClientInfo getGateClientInfo(@PathVariable("clientId") String clientId) {
    Example example = new Example(GateClient.class);
    example.createCriteria().andEqualTo("code",clientId);
    ClientInfo info = new ClientInfo();
    GateClient gateClient = gateClientBiz.selectByExample(example).get(0);
    BeanUtils.copyProperties(gateClient, info);
    info.setLocked(CommonConstant.BOOLEAN_NUMBER_TRUE.equals(gateClient.getLocked()));
    return info;
  }
}
