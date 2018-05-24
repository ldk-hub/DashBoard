package com.com.vo;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@EqualsAndHashCode(of = "uid")
@ToString
public class Member {
	/*
	 * 롬복 기능 자동 Getter Setter을 통해  시간 단축 up 
	 * POJO Class의 member 변수만 선언하면 자동으로 빌드
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
		
		/* cascade의 경우에는 엔티티들의 영속관계를 한번에 처리하지 못하기 때문에 이에 대한 cascade\
			설정을 추가하는것이고, member와 member_role을 둘다 동시에 조회하기 위해서 fetch
			 설정을 즉시 로딩으로 EAGER 설정을 주어야 에러가 발생하지 않는다.*/
		@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
		@JoinColumn(name="uid")
		private List<MemberRole> roles;
		
}
