package com.com.gentelella.service;

import com.com.vo.User;

public interface UserService {
	void saveUser(User user, String[] roles);

	User findByUsername(String username);

}
