package com.com.gentelella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.com.gentelella.repository.UserRepository;
import com.com.gentelella.vo.RoleType;
import com.com.gentelella.vo.User;

@Service
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
	  //기존
	  //  User user = userRepository.findByUsername(username);
		
	  
		User user = userRepository.findByUsername(username).orElseGet(()->{
  			return new User(); //기존에없었
  		});
  		return user;
  }
  
  
  
    //기존회원 및 중복회원 서칭
  	@Transactional(readOnly=true)
  	public User oauthUserScan(String username) {
  		User user = userRepository.findByUsername(username).orElseGet(()->{
  			return new User();
  		});
  		return user;
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