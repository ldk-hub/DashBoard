package com.com.gentelella.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.com.gentelella.controller.MemberRepository;
import com.com.vo.Member;
import com.com.vo.SecurityMember;

@Service
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	MemberRepository memberRepository;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		return
				Optional.ofNullable(memberRepository.findByUemail(email))
				.filter(m -> m!= null)
				.map(m -> new SecurityMember((Member) m)).get();
	}
}