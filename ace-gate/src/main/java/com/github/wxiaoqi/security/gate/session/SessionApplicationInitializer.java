package com.github.wxiaoqi.security.gate.session;

import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.session.web.context.AbstractHttpSessionApplicationInitializer;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-23 8:37
 */
@Service
public class SessionApplicationInitializer  extends AbstractHttpSessionApplicationInitializer {
    @Override
    protected void afterSessionRepositoryFilter(ServletContext servletContext) {
        servletContext.addListener(new HttpSessionEventPublisher());
    }
}