package com.com.gentelella.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.com.gentelella.certification.CustomAuthenticationFailure;
import com.com.gentelella.certification.CustomAuthenticationSuccess;

 @Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
  
	@Autowired
	private UserDetailsService userDetailsService;
  
	  @Bean
	  public BCryptPasswordEncoder bCryptPasswordEncoder() {
	      return new BCryptPasswordEncoder(); //시큐리티 기본제공 암호화인코더
	  }
	  
	  @Override
	  protected void configure(HttpSecurity http) throws Exception{
	    http
	      .authorizeRequests()
	        .antMatchers("/**").permitAll() // 시큐리티 허용 url을 선언한다. 아직 페이지개발완성이 덜되서 마지막에 경로지정할 것
	        .anyRequest().authenticated()
	        .and()
	      .formLogin()
	        .loginPage("/login") /* 내가 만든 로그인 페이지 */
	        .successHandler(new CustomAuthenticationSuccess()) // 로그인 성공 핸들러 
	        .failureHandler(new CustomAuthenticationFailure()) // 로그인 실패 핸들러 
	        .permitAll()
	        .and()
	      .logout()
		      .logoutRequestMatcher(new AntPathRequestMatcher("/logout")) //logout 을 호출할 경우 로그아웃
	          .invalidateHttpSession(true) //세션날리기
	          .logoutSuccessUrl("/login"); //로그아웃 성공시 이동할 경로
	         //   .and()
	       //.exceptionHandling().accessDeniedPage("/403")권한이 없을경우 해당 url로 이동
	  }
  
	  @Autowired
	  public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	      auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
	  }  
}
