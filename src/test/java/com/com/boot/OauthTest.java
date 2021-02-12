package com.com.boot;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;

public class OauthTest {

	
	//1. TDD 중요 
	// 실패하는 테스트 케이스 작성한다.
	// 성공하는 테스트 케이스를 작성한다.
	// 리팩토링 - 반복되거나 지저분한 비효율적인 코드를 효율적으로 개선하여 작성한다.
	
	//1. 테스트 코드에서는 로그는 비추 
	//실행되는 테스트 함수명으로 목적을 명확하게 하는게중요.
	
	//2. 테스트 코드에서는 메소드간 의존관계는 없애는게 좋음.
	
	//테스트 구현방법 3가지 
	//테스트 ->가짜구현 -> 삼각측량 -> 명백한 구현
	// 테스트 -> 가짜구현 -> 명백한 구현
	//테스트 -> 명백한 구현
	
	
	@Test
	public void testKakaoInfo() {
		//기존 데이터 테스트 코드에 앞서  JUnit 동작관련 테스트  파일 전부 재구성예정
		ObjectTest objTest = new ObjectTest();
		//assertThat(objTest.memData(), is("test")); //assertThat 테스트한 값과, 결과값을 비교하여 성공적인 값인지 비교 기능
		
	}
}
