package com.com.gentelella.controllerTest;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

public class DashBoardControllerTest {

	
	//TDD, BDD, DDD 각 환경별 유스케이스에 따라 테스트케이스 작성 
	@Test
	public void 계정_로그인확인() {
		
		//given(준비)
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//when(실행)
		
		if(loggedInUser != null) {
			System.out.println("success");
		}
		//then(검증)
		
		assertThat(user);
		assertThat(loggedInUser);
		//assertThat(null);
		//assertEquals();
		
	}
}
