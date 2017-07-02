package com.github.wxiaoqi.security.api.gate.secruity;


import com.github.wxiaoqi.security.api.gate.vo.JwtUser;
import com.github.wxiaoqi.security.api.vo.gate.ClientInfo;
import com.github.wxiaoqi.security.api.vo.user.UserInfo;

import java.util.Date;

public final class JwtUserFactory {

    private JwtUserFactory() {
    }

    public static JwtUser create(ClientInfo info) {
        return new JwtUser(
                info.getId()+"",
                info.getCode(),
                info.getSecret(),
                null,
                new Date(), info.isLocked());
    }

}

