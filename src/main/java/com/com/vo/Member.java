package com.com.vo;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import org.apache.ibatis.mapping.FetchType;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Entity;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.mapping.List;
import org.springframework.data.annotation.Id;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/*@Getter//lombok
@Setter//lombok
@Entity//jpa
@EqualsAndHashCode(="uid")//lombok
@ToString//lombok
*/public class Member {
	/*
	 * 롬복 기능 자동 Getter Setter을 통해  시간 단축 up 
	 * POJO Class의 member 변수만 선언하면 자동으로 빌드
	 * @Data
	 */
	
	@Id
	@GeneratedValue
	private Long id;
	
	@Column(nullable = false, unique = true, length=50)
	private String uid;
	
	@Column(nullable = false, length=200)
	private String upw;
	
	@Column(nullable = false, unique = true, length=50)
	private String uemail;
	
	@CreationTimestamp
	private Date regdate;
	
	@UpdateTimestamp
	private Date updatedate;
	
	/*@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="uid")
	private List<MemberRole> roles;*/
}
