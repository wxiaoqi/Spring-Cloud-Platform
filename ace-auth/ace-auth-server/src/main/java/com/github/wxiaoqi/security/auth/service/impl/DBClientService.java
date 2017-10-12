package com.github.wxiaoqi.security.auth.service.impl;

import com.github.wxiaoqi.security.auth.bean.ClientInfo;
import com.github.wxiaoqi.security.auth.entity.Client;
import com.github.wxiaoqi.security.auth.mapper.ClientMapper;
import com.github.wxiaoqi.security.auth.service.ClientService;
import com.github.wxiaoqi.security.auth.util.client.ClientTokenUtil;
import com.github.wxiaoqi.security.common.exception.auth.ClientInvalidException;
import com.github.wxiaoqi.security.common.util.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.scheduling.annotation.Scheduled;
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
    @Autowired
    private DiscoveryClient discovery;
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
            throw new ClientInvalidException("Client not found or Client secret is error!");
        }
        return client;
    }

    @Override
    public List<String> getAllowedClient(String clientId, String secret) {
        Client info = this.getClient(clientId, secret);
        return clientMapper.selectAllowedClient(info.getId()+"");
    }

    @Override
    @Scheduled(cron = "0 0/1 * * * ?")
    public void registryClient() {
        // 自动注册节点
        discovery.getServices().forEach((name) ->{
            Client client = new Client();
            client.setName(name);
            client.setCode(name);
            if(clientMapper.selectCount(client)== 0) {
                client.setSecret(UUIDUtils.generateShortUuid());
                clientMapper.insert(client);
            }
        });
    }
}
