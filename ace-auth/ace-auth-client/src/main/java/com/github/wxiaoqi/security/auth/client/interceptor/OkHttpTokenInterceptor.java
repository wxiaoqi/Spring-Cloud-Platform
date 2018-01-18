package com.github.wxiaoqi.security.auth.client.interceptor;

import com.github.wxiaoqi.security.auth.client.config.ServiceAuthConfig;
import com.github.wxiaoqi.security.auth.client.jwt.ServiceAuthUtil;
import com.github.wxiaoqi.security.common.constant.CommonConstants;
import lombok.extern.java.Log;
import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import java.io.IOException;


/**
 * @author ace
 */
@Component
@Log
public class OkHttpTokenInterceptor implements Interceptor {
	@Autowired
	@Lazy
	private ServiceAuthUtil serviceAuthUtil;
	@Autowired
	@Lazy
	private ServiceAuthConfig serviceAuthConfig;


	@Override
	public Response intercept(Chain chain) throws IOException {
		Request request = chain.request();
	    Response response = chain.proceed(request);
		if(HttpStatus.FORBIDDEN.value()==response.code()){
			if(response.body().string().contains(String.valueOf(CommonConstants.EX_CLIENT_INVALID_CODE))){
				log.info("Client Token Expire,Retry to request...");
				serviceAuthUtil.refreshClientToken();
				Request newRequest = chain.request()
						.newBuilder()
						.header(serviceAuthConfig.getTokenHeader(),serviceAuthUtil.getClientToken())
						.build();
				response = chain.proceed(newRequest);
			}
		}
	    return response;
	}

}
