package com.com.gentelella.vo;

import java.util.Collection;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter 
@ToString
public class UserCustom extends User {
private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

private String organization_code;

//로그인시 아이디 패스워드 와 추가정보를 더 가져올때 사용
public UserCustom(String username, String password
       , boolean enabled, boolean accountNonExpired
       , boolean credentialsNonExpired, boolean accountNonLocked
       , Collection<? extends GrantedAuthority> authorities
       , String organization_code) {
   	super(username, password
           , enabled, accountNonExpired
           , credentialsNonExpired, accountNonLocked
           , authorities);
   	this.organization_code = organization_code;
  }

/*public String getOrganization_code() {
	return organization_code;
}

public void setOrganization_code(String organization_code) {
	this.organization_code = organization_code;
}

@Override
public String toString() {
	return super.toString() + "; Organization"+this.organization_code;
	}
*/
}

