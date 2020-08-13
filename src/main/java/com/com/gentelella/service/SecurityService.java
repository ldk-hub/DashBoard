package com.com.gentelella.service;

public interface SecurityService {
	//중복정보 조회처리
	String findLoggedInUsername();
	//자동로그인 처리
	void autologin(String username, String password);
}
