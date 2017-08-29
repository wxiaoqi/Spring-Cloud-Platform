package com.github.wxiaoqi.security.gate.controller;

import com.github.wxiaoqi.security.gate.jwt.JwtAuthenticationRequest;
import com.github.wxiaoqi.security.gate.service.AuthService;
import com.github.wxiaoqi.security.gate.jwt.JwtAuthenticationResponse;
import com.github.wxiaoqi.security.gate.vo.FrontUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("jwt")
public class AuthController {
    @Value("${gate.jwt.header}")
    private String tokenHeader;

    @Autowired
    private AuthService authService;

    @RequestMapping(value = "token", method = RequestMethod.POST)
    public ResponseEntity<?> createAuthenticationToken(
            @RequestBody JwtAuthenticationRequest authenticationRequest) {
        final String token = authService.login(authenticationRequest.getUsername(), authenticationRequest.getPassword());
        return ResponseEntity.ok(new JwtAuthenticationResponse(token));
    }

    @RequestMapping(value = "refresh", method = RequestMethod.GET)
    public ResponseEntity<?> refreshAndGetAuthenticationToken(
            HttpServletRequest request) {
        String token = request.getHeader(tokenHeader);
        String refreshedToken = authService.refresh(token);
        if(refreshedToken == null) {
            return ResponseEntity.badRequest().body(null);
        } else {
            return ResponseEntity.ok(new JwtAuthenticationResponse(refreshedToken));
        }
    }

    @RequestMapping(value = "verify", method = RequestMethod.GET)
    public ResponseEntity<?> verify(String token,String resource){
        if(authService.validate(token,resource))
            return ResponseEntity.ok(true);
        else
            return ResponseEntity.status(401).body(false);
    }

    @RequestMapping(value = "invalid", method = RequestMethod.POST)
    public ResponseEntity<?> invalid(@RequestHeader("access-token") String token){
        authService.invalid(token);
        return ResponseEntity.ok(true);
    }

    @RequestMapping(value = "user", method = RequestMethod.GET)
    public ResponseEntity<?> getUserInfo(String token){
        FrontUser userInfo = authService.getUserInfo(token);
        if(userInfo==null)
            return ResponseEntity.status(401).body(false);
        else
            return ResponseEntity.ok(userInfo);
    }
}
