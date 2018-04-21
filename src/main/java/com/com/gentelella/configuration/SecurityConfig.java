package com.com.gentelella.configuration;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

//스프링 시큐리티 접근 제어 
//초기 메이븐 디펜던시 선언시 모든 사이트접근이 잠기게 된다. 하단의 모든 접근 경로 해제하는 명령어 참조
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	
	@Override
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
	}
}