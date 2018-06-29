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
    
  @Override  
  public void saveUser(User user,String[] roles) {
    user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
    System.out.println("@@@id"+user.getUsername());//id
    System.out.println("@@@닉네임"+user.getNickname());//닉네임
    System.out.println("@@@패스워드"+user.getPassword());//암호화 된 패스워드
    System.out.println("@@@성별"+user.getSex()); //성별
    System.out.println("@@@이메일주소"+user.getEmail());//이메일
    
    Set<Role> rolesSet = new HashSet<Role>();
   /* for(String role:roles){
      rolesSet.add(new Role(role));
      System.out.println("111"+rolesSet);
    }*/
    user.setRoles(rolesSet);
    //System.out.println("222"+user.getRoles());
    userRepository.save(user);
  }
  @Override
  public User findByUsername(String username) {
    return userRepository.findByUsername(username);
  }
}
