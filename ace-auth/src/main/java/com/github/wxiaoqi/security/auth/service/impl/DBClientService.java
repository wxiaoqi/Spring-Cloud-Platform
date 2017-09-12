package com.github.wxiaoqi.security.auth.service.impl;

import com.github.wxiaoqi.security.auth.bean.ClientInfo;
import com.github.wxiaoqi.security.auth.entity.Client;
import com.github.wxiaoqi.security.auth.mapper.ClientMapper;
import com.github.wxiaoqi.security.auth.service.ClientService;
import com.github.wxiaoqi.security.auth.util.client.ClientTokenUtil;
import com.github.wxiaoqi.security.common.exception.auth.ClientInvalidException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ace on 2017/9/10.
 */
@Service
public class DBClientService implements ClientService {
    @Autowired
    private ClientMapper clientMapper;
    @Autowired
    private ClientTokenUtil clientTokenUtil;
    @Override
    public String apply(String clientId, String secret) throws Exception {
        Client client = getClient(clientId, secret);
        return clientTokenUtil.generateToken(new ClientInfo(client.getCode(),client.getName(),client.getId().toString()));
    }

    private Client getClient(String clientId, String secret) {
        Client client = new Client();
        client.setCode(clientId);
        client = clientMapper.selectOne(client);
        if(client==null||!client.getSecret().equals(secret)){
            throw new ClientInvalidException("Client not foud or Client secret is error!");
        }
        return client;
    }

    @Override
    public List<String> getAllowedClient(String clientId, String secret) {
        Client info = this.getClient(clientId, secret);
        return clientMapper.selectAllowedClient(info.getId()+"");
    }
}
