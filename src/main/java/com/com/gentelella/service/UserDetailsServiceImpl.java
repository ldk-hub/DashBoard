package com.com.gentelella.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.com.gentelella.repository.UserRepository;
import com.com.gentelella.vo.Role;
import com.com.gentelella.vo.User;
 
@Component
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    UserRepository userRepository;
 
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        
        //초기 구현당시 ADMIN 과 USER 권한을 프론트에서 회원가입 당시 처리하려 했으나 관리자가 페이지 내부에서 제어해야 하는 구조가 좋기에 변경
       /* for (Role role : user.getRoles()) {
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
        }*/
 
        return new org.springframework.security.core.userdetails.User(user.getUsername(), 
                                                                      user.getPassword(),
                                                                      grantedAuthorities);
    }
}
