package com.com.gentelella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SecurityServiceImpl implements SecurityService {
    @Autowired
    private UserDetailsService userDetailsService;
 
    @Autowired
    private AuthenticationManager authenticationManager;
 
    @Override
    public String findLoggedInUsername() {
        Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
        if (userDetails instanceof UserDetails) {
            return ((UserDetails) userDetails).getUsername();
        }
        return null;
    }
 
    @Override
    public void autologin(String username, String password) {
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        //인증받을 때 아이디를 전달받아 인증받은 후 DB에서 받은 객체로 변경됨
        //사용자 패스워드가 들어있으며 인증완료후 디폴트로 제거함
        //사용자 인증 시 전달된 정보에서 아이피 세션아이디 를 가져와 저장한다.
        //인증전 인증 후의 세션값이 변경됨<<<<핵심
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken 
         = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities()); 
 
        authenticationManager.authenticate(usernamePasswordAuthenticationToken);
 
        if (usernamePasswordAuthenticationToken.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
            log.debug(String.format("자동 로그인 % 성공", password));
        }
    }
}