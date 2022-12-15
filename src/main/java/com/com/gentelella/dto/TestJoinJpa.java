package com.com.gentelella.dto;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;

@Entity
@Getter
public class TestJoinJpa {

	//>>>>>>>>>>>>기본적으로 추천하는 페치전략은 모든 연관관계에 지연로딩을 사용하는것이다.<<<<<
	@Id@GeneratedValue
	private int seq;
	//즉시로딩 N:1 관계시 
	//즉시로딩을 최적화 하기 위해 가능하면 조인쿼리를 사용한다.
	//1. EAGER사용시 주의점 컬렉션을 하나 이상 즉시로딩하는것은 권장하지 않는다.
	//2. 컬렉션 즉시로딩을 항상 외부 조인을 쓴다.
	@ManyToOne(fetch= FetchType.EAGER) 
	@JoinColumn(name = "EAGER_ID")
	private Team TestEagerJoin;
	
	//연관된 엔티티를 프록시로 조회한다. 프록시를 실제 사용할 때 초기화하면서 데이터베이스를 조회한다.
	@ManyToOne(fetch= FetchType.LAZY) //지연로딩 
	@JoinColumn(name = "LAZY_ID")
	private Team Team;

	
}
