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
  
	  @Bean //시큐리티 기본제공 암호화인코더
	  public BCryptPasswordEncoder bCryptPasswordEncoder() {
	      return new BCryptPasswordEncoder(); 
	  }
  
	  @Autowired
	  public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	      auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
	  }  
	  
	  @Override
	  protected void configure(HttpSecurity http) throws Exception{
	    http.csrf().disable()
	      .authorizeRequests()
	        .antMatchers("/**").permitAll() // 시큐리티 허용 url을 선언한다. 아직 페이지개발완성이 덜되서 마지막에 허용시킬 경로지정할 것
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
	          .logoutSuccessUrl("/login") //로그아웃 성공시 이동할 경로
	          .and()
	          // Remember Me 추가
	          // 아래의 코드를 추가하면 'configureGlobal' 을 사용하지 않아도 된다.
	          //      만약 passwordEncoder 를 사용하는 경우는 사용해야 한다.
	          // 아래도 체인 순서는 중요하다.
	          .rememberMe()
	          .key("springBootBase")           // 쿠키값으로 암호화된 값을 전달하고, 로그인 상태를 기억합니다.
	          .rememberMeParameter("remember-me")
	          .tokenValiditySeconds(2419200)       // 쿠키유지 시간(설정되어있지 않으면 기본 2주)
	          .and()
	          .sessionManagement()
	          .maximumSessions(1)//최대접속세션계정당 1개
	          .maxSessionsPreventsLogin(true)//이전세션 강퇴시키고 새로접속시도한사람이 들어가게끔
	          .expiredUrl("/500error");
	    //.antMatchers("/kakao").hasAuthority(KAKAO.getRoleType())//카카오  해당 권한을 지닌 사용자만 경로를 사용할 수 있도록 통제
	       /*   .and()
	      .exceptionHandling().accessDeniedPage("/403");//권한이 없을경우 해당 url로 이동
*/	  }
}
