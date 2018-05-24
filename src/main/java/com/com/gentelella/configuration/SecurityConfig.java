package com.com.gentelella.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.com.gentelella.service.CustomUserDetailsService;

//********어드민페이지로 어드민만 접근가능하도록 설계 일반권한접근가능유무도 테스트할것
//스프링 시큐리티 접근 제어 
//초기 메이븐 디펜던시 선언시 모든 사이트접근이 잠기게 된다.그래서 하단의 기능추가로 접근경로를 풀어준다.
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	CustomUserDetailsService customUserDetailsService;
	
	
	@Bean
	public PasswordEncoder passwordEncoder() {
	  return new BCryptPasswordEncoder();
	}
	//SecurityConfig에서 AuthenticationManagerBuilder를 주입해서 인증에 대한 처리를 해야 한다.
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	  auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
	}
	
	/* 
	시큐리티 옵션 설정
	anonymous()
	인증되지 않은 사용자가 접근할 수 있습니다.
	authenticated()
	인증된 사용자만 접근할 수 있습니다.
	fullyAuthenticated()
	완전히 인증된 사용자만 접근할 수 있습니다(?)
	hasRole() or hasAnyRole()
	특정 권한을 가지는 사용자만 접근할 수 있습니다.
	hasAuthority() or hasAnyAuthority()
	특정 권한을 가지는 사용자만 접근할 수 있습니다.
	hasIpAddress()
	특정 아이피 주소를 가지는 사용자만 접근할 수 있습니다.
	access()
	SpEL 표현식에 의한 결과에 따라 접근할 수 있습니다.
	not() 접근 제한 기능을 해제합니다.
	permitAll() or denyAll()
	접근을 전부 허용하거나 제한합니다.
	rememberMe()
	리멤버 기능을 통해 로그인한 사용자만 접근할 수 있습니다.*/
	@Override
	protected void configure(HttpSecurity http) throws Exception
	{
		http.authorizeRequests()
			.antMatchers("/admin/**").hasRole("ADMIN")
			.antMatchers("/dashboard/**").authenticated()//로그인해야만접근가능
			.antMatchers("/**").permitAll()
			.and().formLogin()
			.loginPage("/login")
			.loginProcessingUrl("/login")
			.defaultSuccessUrl("/")
	    	.failureUrl("/login")
	    	.and()
	    	.logout();
	}
	
	/*@Override
	public void configure(WebSecurity web) throws Exception
	{
		web.ignoring().antMatchers("/css/**", "/script/**", "image/**", "/fonts/**", "lib/**");
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception
	{
		// 여기에선 리소스외에 페이지의 인증/비인증/인증권한등을 설정하는게 좋은것 같습니다.
		http.authorizeRequests()
			// 어드민 권한으로만 접근할 수 있는 경로
			.antMatchers("/admin/**").hasRole("ADMIN")
			//모든 접근 경로 해제(임시)
			.antMatchers("/**").permitAll();
	}*/
	
	
	
}

