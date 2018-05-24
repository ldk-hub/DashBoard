package com.com.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SecurityMember extends User {
	private static final String ROLE_PREFIX = "ROLE_";
	private static final long serialVersionUID = 1L;
	
	public SecurityMember(Member member) {
		super(member.getUid(), member.getUpw(), makeGrantedAuthority(member.getRoles()));
	}
	
	private static List<GrantedAuthority> makeGrantedAuthority(List<MemberRole> roles){
		List<GrantedAuthority> list = new ArrayList<>();
		roles.forEach(role -> list.add(new SimpleGrantedAuthority(ROLE_PREFIX + role.getRoleName())));
		return list;
	}
}