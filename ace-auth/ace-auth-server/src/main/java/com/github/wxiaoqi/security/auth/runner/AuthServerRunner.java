package com.github.wxiaoqi.security.auth.runner;

import com.github.wxiaoqi.security.auth.common.util.jwt.RsaKeyHelper;
import com.github.wxiaoqi.security.auth.configuration.KeyConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

/**
 * @author ace
 * @create 2017/12/17.
 */
@Configuration
public class AuthServerRunner implements CommandLineRunner {
    @Autowired
    private KeyConfig keyConfig;
    @Override
    public void run(String... args) throws Exception {
        Map<String, byte[]> keyMap = RsaKeyHelper.generateKey(keyConfig.getUserSecret());
        keyConfig.setUserPriKey(keyMap.get("pri"));
        keyConfig.setUserPubKey(keyMap.get("pub"));
        keyMap = RsaKeyHelper.generateKey(keyConfig.getServiceSecret());
        keyConfig.setServicePriKey(keyMap.get("pri"));
        keyConfig.setServicePubKey(keyMap.get("pub"));
    }
}
