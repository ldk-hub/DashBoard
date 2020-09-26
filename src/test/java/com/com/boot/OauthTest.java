package com.com.boot;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;

public class OauthTest {

	
	@Test
	public void testKakaoInfo() {
		//기존 데이터 테스트 코드에 앞서  JUnit 동작관련 테스트  파일 전부 재구성예정
		Calculator calculator = new Calculator();
		assertThat(calculator.plus(1,2), is(3));
		
	}
}
