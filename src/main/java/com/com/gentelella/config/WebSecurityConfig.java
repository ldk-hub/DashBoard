package com.com.gentelella.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.com.gentelella.certification.CustomAuthenticationFailure;
import com.com.gentelella.certification.CustomAuthenticationSuccess;

 @Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
  
	@Autowired
	private UserDetailsService userDetailsService;
  
	  @Bean
	  public BCryptPasswordEncoder bCryptPasswordEncoder() {
	      return new BCryptPasswordEncoder();
	  }
	  
	  @Override
	  protected void configure(HttpSecurity http) throws Exception{
	    http
	      .authorizeRequests()
	        .antMatchers("/**").permitAll() // 해당 url을 허용한다. 
	        .anyRequest().authenticated()
	        .and()
	      .formLogin()
	        .loginPage("/login")
	        .successHandler(new CustomAuthenticationSuccess()) // 로그인 성공 핸들러 
	        .failureHandler(new CustomAuthenticationFailure()) // 로그인 실패 핸들러 
	        .permitAll()
	        .and()
	      .logout()
	        .permitAll()
	        .and()
	       .exceptionHandling().accessDeniedPage("/403"); // 권한이 없을경우 해당 url로 이동
	  }
  
	  @Autowired
	  public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	      auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
	  }  
}
