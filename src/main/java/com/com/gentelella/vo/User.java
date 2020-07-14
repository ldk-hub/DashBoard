package com.com.gentelella.vo;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
//기본적으로 @Entity로 선언된 클래스의 이름은 실제 데이터베이스의 테이블 명과 일치하는 것을 매핑.
//따라서 @Entity의 클래스명과 데이터베이스의 테이블명이 다르면 @Table(name="XXX") 같은 형식으로 작성하면 이름을 다르게 해서 매핑 가능합니다.
@Table(name = "AP_USERS")
@Data
public class User {
  @Id
  //일반적으로 키(primary key)를 가지는 변수에 선언합니다. @GeneratedValue 어노테이션은 해당 Id 값을 어떻게 자동으로 생성할지 전략을 선택할 수 있습니다.
  @GeneratedValue(strategy = GenerationType.AUTO)//
  private Long id;
  /*선언은 꼭 필요한 것은 아닙니다. 
  하지만 그것과 별개로 @Column에서 지정한 멤버 변수와 데이터베이스의 컬럼명을 다르게 주고 싶다면 @Column(name="XXX") 
  같은 형식으로 작성해주면 됩니다. 그렇지 않으면 기본적으로 멤버 변수명과 일치하는 데이터베이스의 컬럼을 매핑합니다.*/
  @Column
  private String username;
  public Long getId() {
	return id;
}

public void setId(Long id) {
	this.id = id;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getSex() {
	return sex;
}

public void setSex(String sex) {
	this.sex = sex;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getNickname() {
	return nickname;
}

public void setNickname(String nickname) {
	this.nickname = nickname;
}

public Date getRegdate() {
	return regdate;
}

public void setRegdate(Date regdate) {
	this.regdate = regdate;
}

public Set<Role> getRoles() {
	return roles;
}

public void setRoles(Set<Role> roles) {
	this.roles = roles;
}

@Column
  private String password;
  @Column
  private String sex;
  @Column
  private String email;
  @Column
  private String nickname;
  @CreationTimestamp
  private Date regdate;//생성상세날짜를 기록하고 아직 로그인정보 수정페이지 미구현으로 추후 업데이트날짜 추가
  
  @ManyToMany(cascade=CascadeType.ALL) 
  @JoinTable(name = "ap_user_role",
             joinColumns = @JoinColumn(name = "user_id"),
             inverseJoinColumns = @JoinColumn(name = "role_id"))
  
  private Set<Role> roles;

}
