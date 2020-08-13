package com.com.gentelella.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.com.gentelella.repository.UserRepository;
import com.com.gentelella.vo.Role;
import com.com.gentelella.vo.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserServiceImpl implements UserService {
  @Autowired
  private UserRepository userRepository;
  
  @Autowired
  private BCryptPasswordEncoder bCryptPasswordEncoder;
 
  //로그인 유저정보 암복호화처리
  @Override  
  public void saveUser(User user,String[] roles) {
    user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
    
    Set<Role> rolesSet = new HashSet<Role>();
    user.setRoles(rolesSet);
    userRepository.save(user);
  }
  //유저정보 호출
  @Override
  public User findByUsername(String username) {
    return userRepository.findByUsername(username);
  }
}
