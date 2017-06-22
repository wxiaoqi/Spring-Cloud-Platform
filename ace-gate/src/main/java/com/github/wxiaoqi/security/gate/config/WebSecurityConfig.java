package com.github.wxiaoqi.security.gate.config;

import com.github.wxiaoqi.security.api.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-02 12:02
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.formLogin().loginPage("/login").defaultSuccessUrl("/admin/index").permitAll().and()
        .logout().logoutSuccessUrl("/login").invalidateHttpSession(true).and().authorizeRequests()
        .antMatchers("/**/*.css", "/img/**", "/api/**", "/**/*.js") // 放开"/api/**"：为了给被监控端免登录注册
        .permitAll().and().authorizeRequests().antMatchers("/**").authenticated();
    http.csrf().disable();
    http.headers().frameOptions().disable();
    http.httpBasic();
  }

  /*
   * @Autowired // 也可以在application.yml文件中配置登录账号密码：security.user.name/password public void
   * configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
   * auth.inMemoryAuthentication().withUser("whb").password("").roles("USER"); }
   */
}
