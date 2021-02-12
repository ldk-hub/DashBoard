package com.com.gentelella.service;

import javax.transaction.Transactional;

import com.com.gentelella.vo.User;

public interface UserService {
	//유저정보 저장
	void saveUser(User user, String[] roles);
	//유저정보 호출
	User findByUsername(String username);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
