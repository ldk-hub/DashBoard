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
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken 
         = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities()); 
 
        authenticationManager.authenticate(usernamePasswordAuthenticationToken);
 
        if (usernamePasswordAuthenticationToken.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
            log.debug(String.format("자동 로그인 % 성공", password));
        }
    }
}