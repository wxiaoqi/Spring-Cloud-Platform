package com.github.wxiaoqi.security.auth.client.jwt;

import com.github.wxiaoqi.security.auth.client.config.UserAuthConfig;
import com.github.wxiaoqi.security.auth.common.util.jwt.IJWTInfo;
import com.github.wxiaoqi.security.auth.common.util.jwt.JWTHelper;
import com.github.wxiaoqi.security.common.exception.auth.UserTokenException;
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
            return JWTHelper.getInfoFromToken(token, userAuthConfig.getPubKeyByte());
        }catch (ExpiredJwtException ex){
            throw new UserTokenException("User token expired!");
        }catch (SignatureException ex){
            throw new UserTokenException("User token signature error!");
        }catch (IllegalArgumentException ex){
            throw new UserTokenException("User token is null or empty!");
        }
    }
}
