package com.com.gentelella.service;

public interface SecurityService {
	String findLoggedInUsername();

	void autologin(String username, String password);
}
