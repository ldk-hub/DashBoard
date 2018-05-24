package com.com.gentelella.configuration;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

//springSecurityFilterChain을 등록하기 위해서는
//AbstractSecurityWebApplicationInitializer를 상속받은 WebApplicationInitializer를 만들어둔다.
public class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer {
	
	
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
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { SecurityConfig.class };
	}

}





