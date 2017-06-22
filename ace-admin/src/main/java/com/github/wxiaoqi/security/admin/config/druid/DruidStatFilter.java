package com.github.wxiaoqi.security.admin.config.druid;

import com.alibaba.druid.support.http.WebStatFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-20 21:34
 */
@WebFilter(filterName="druidWebStatFilter",urlPatterns="/druid/*",
        initParams={
                @WebInitParam(name="exclusions",value="*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*")// 忽略资源
        })
public class DruidStatFilter extends WebStatFilter {

        @Override
        public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
                response.setContentType("text/html");
                super.doFilter(request, response, chain);
        }
}
