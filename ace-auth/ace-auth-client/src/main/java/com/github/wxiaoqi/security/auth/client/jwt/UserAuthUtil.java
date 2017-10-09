package com.github.wxiaoqi.security.auth.client.jwt;

import com.github.wxiaoqi.security.auth.client.config.UserAuthConfig;
import com.github.wxiaoqi.security.auth.client.exception.JwtIllegalArgumentException;
import com.github.wxiaoqi.security.auth.client.exception.JwtSignatureException;
import com.github.wxiaoqi.security.auth.client.exception.JwtTokenExpiredException;
import com.github.wxiaoqi.security.common.util.jwt.IJWTInfo;
import com.github.wxiaoqi.security.common.util.jwt.JWTHelper;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.SignatureException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

/**
 * Created by ace on 2017/9/15.
 */
@Configuration
public class UserAuthUtil {
    @Autowired
    private UserAuthConfig userAuthConfig;
    public IJWTInfo getInfoFromToken(String token) throws Exception {
        try {
            return JWTHelper.getInfoFromToken(token, userAuthConfig.getPubKeyPath());
        }catch (ExpiredJwtException ex){
            throw new JwtTokenExpiredException("User token expired!");
        }catch (SignatureException ex){
            throw new JwtSignatureException("User token signature error!");
        }catch (IllegalArgumentException ex){
            throw new JwtIllegalArgumentException("User token is null or empty!");
        }
    }
}
