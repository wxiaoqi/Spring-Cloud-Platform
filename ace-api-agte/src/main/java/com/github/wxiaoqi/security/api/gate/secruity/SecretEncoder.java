package com.github.wxiaoqi.security.api.gate.secruity;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-07-02 17:56
 */
public class SecretEncoder implements PasswordEncoder {
    @Override
    public String encode(CharSequence charSequence) {
        return charSequence.toString();
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        if(encodedPassword != null && encodedPassword.length() != 0) {
            return rawPassword.toString().equals(encodedPassword);
        } else {
            return false;
        }
    }
}
