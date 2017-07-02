package com.github.wxiaoqi.security.api.gate.secruity;

import com.github.wxiaoqi.security.api.gate.rpc.IGateService;
import com.github.wxiaoqi.security.api.vo.gate.ClientInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.github.wxiaoqi.security.api.vo.user.UserInfo;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-07-02 13:19
 */
@Service
public class JwtUserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private IGateService gateService;
    @Override
    public UserDetails loadUserByUsername(String clientId) throws UsernameNotFoundException {
        ClientInfo info = null;
        try {
            info = gateService.getGateClientInfo(clientId);
        }catch (Exception e){
            e.printStackTrace();
        }
        if (info == null) {
            throw new UsernameNotFoundException(String.format("No user found with username '%s'.", clientId));
        } else {
            return JwtUserFactory.create(info);
        }
    }
}
