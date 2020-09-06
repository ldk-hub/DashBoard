package com.com.gentelella.service;

import com.com.gentelella.vo.User;

public interface UserService {
	//유저정보 저장
	void saveUser(User user, String[] roles);
	//유저정보 호출
	User findByUsername(String username);

	/*@Transactional
	public void oauthUser(User user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRole(RoleType.USER);
		userRepository.save(user);
	}*/
}
