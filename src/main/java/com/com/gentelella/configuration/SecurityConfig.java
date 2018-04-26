package com.com.gentelella.configuration;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

//********어드민페이지로 어드민만 접근가능하도록 설계 일반권한접근가능유무도 테스트할것
//스프링 시큐리티 접근 제어 
//초기 메이븐 디펜던시 선언시 모든 사이트접근이 잠기게 된다.그래서 하단의 기능추가로 접근경로를 풀어준다.
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