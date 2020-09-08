package com.com.gentelella.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.com.gentelella.repository.UserRepository;
import com.com.gentelella.vo.Role;
import com.com.gentelella.vo.RoleType;
import com.com.gentelella.vo.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserServiceImpl implements UserService {
  @Autowired
  private UserRepository userRepository;
  
  @Autowired
  private BCryptPasswordEncoder bCryptPasswordEncoder;
 
  //회원가입로직
  @Override  
  public void saveUser(User user,String[] roles) {
    user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
    user.setRole(RoleType.USER);
    userRepository.save(user);
  }
  
  
  //유저정보 호출
  @Override
  public User findByUsername(String username) {
    return userRepository.findByUsername(username);
  }
  

    //카카오 API 로그인시 회원정보추가
    @Transactional
	public void oauthUser(User user) {
		String rawPassword = user.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRole(RoleType.USER);
		userRepository.save(user);
	}
}
