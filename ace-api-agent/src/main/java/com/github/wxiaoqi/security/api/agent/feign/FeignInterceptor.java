package com.github.wxiaoqi.security.api.agent.feign;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.wxiaoqi.security.api.agent.exception.AuthenticationServerErrorException;
import com.github.wxiaoqi.security.api.agent.exception.AuthenticationVerifyFailException;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import jodd.http.HttpRequest;
import jodd.http.HttpResponse;
import org.apache.commons.lang3.StringUtils;

import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Created by ace on 2017/7/5.
 */
public class FeignInterceptor implements RequestInterceptor {

    private String clientId;
    private String secret;
    private String authHeader;
    private static String authHost;
    private String tokenHead;

    public FeignInterceptor(String clientId, String secret, String header, String authHost, String tokenHead) {
        this.clientId = clientId;
        this.secret = secret;
        this.authHeader = header;
        this.authHost = authHost;
        this.tokenHead = tokenHead;
        getTokenStrategy = new AutoKeepAliveStrategy();
    }

    @Override
    public void apply(RequestTemplate requestTemplate) {
        String token = getTokenStrategy.getAccessToken(clientId, secret);
        requestTemplate.header(authHeader,tokenHead+" "+token);
    }

    private static String getToken(String clientId,String secret) throws AuthenticationServerErrorException, AuthenticationVerifyFailException {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("clientId",clientId);
        jsonObject.put("secret",secret);
        HttpResponse response = HttpRequest.post(authHost + "/auth").contentType("application/json").body(jsonObject.toJSONString())
                .send();
        if (response.statusCode() == 200) {
           String token = JSON.parseObject(response.body()).getString("token");
            //容错
            if (StringUtils.isBlank(token)) {
                throw new AuthenticationServerErrorException(JSON.toJSONString(response));
            }
            return token;
        } else if (response.statusCode() == 401) {
            throw new AuthenticationVerifyFailException(JSON.toJSONString(response));
        } else {
            throw new AuthenticationServerErrorException(JSON.toJSONString(response));
        }
    }

    /**
     * Token获取接口
     * 提供续命，不续命两种实现
     */
    private interface GetTokenStrategy {
        String getAccessToken(String appId, String appSecret) throws AuthenticationVerifyFailException, AuthenticationServerErrorException;
    }

    /**
     * 使用自动续命的方式获取Token
     * 线程安全
     */
    private static final class AutoKeepAliveStrategy implements GetTokenStrategy {
        /**
         * 续命所需的App信息
         * 线程安全
         */
        private static final class ClientInfo {
            private final String clinetId;
            private final String secret;

            ClientInfo(String clientId, String secret) {
                this.clinetId = clientId;
                this.secret = secret;
            }
        }

        private static ClientInfo appInfo;
        private static final AtomicReference<ScheduledThreadPoolExecutor> executor = new AtomicReference<ScheduledThreadPoolExecutor>();
        private static final AtomicReference<String> accessToken = new AtomicReference<String>();

        @Override
        public String getAccessToken(String appId, String appSecret) throws AuthenticationVerifyFailException, AuthenticationServerErrorException {
            appInfo = new ClientInfo(appId, appSecret);
            accessToken.compareAndSet(null, getToken(appId, appSecret));
            executor.compareAndSet(null, scheduledExecutor());
            return accessToken.get();
        }

        private ScheduledThreadPoolExecutor scheduledExecutor() {
            ScheduledThreadPoolExecutor executor = new ScheduledThreadPoolExecutor(1);
            executor.scheduleAtFixedRate(new Runnable() {
                @Override
                public void run() {
                    try {
                        accessToken.set(getToken(appInfo.clinetId, appInfo.secret));
                    } catch (AuthenticationVerifyFailException e) {
                        e.printStackTrace();
                    } catch (AuthenticationServerErrorException e) {
                        e.printStackTrace();
                    }
                }
            }, 0, iacKeepalive, TimeUnit.MINUTES);
            return executor;
        }
    }

    private static final class NoKeepAliveStrategy implements GetTokenStrategy {
        @Override
        public String getAccessToken(String appId, String appSecret) throws AuthenticationVerifyFailException, AuthenticationServerErrorException {
            return getToken(appId, appSecret);
        }
    }

    private static GetTokenStrategy getTokenStrategy;
    private static long iacKeepalive = 30L;

}
