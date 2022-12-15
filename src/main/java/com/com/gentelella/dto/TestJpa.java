package com.com.gentelella.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicUpdate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//이 dto는 jpa에서 자주사용하는 기능테스트용 dto이다.

@Builder //롬복,  
@ToString
@DynamicUpdate //컬럼이 30개 이상이 될때  해당 어노테이션을 통한 동적 수정쿼리가 빠르다.수정된 데이터만 사용해 동적으로 update sql 생성한다.
@Getter //롬복
@Setter
@Entity(name = "name2") //jpa
@Table(name = "TestTable")//, uniqueConstraints = {@UniqueConstraint(name = "NAME_AGE_UNIQUE", columnNames = {"NAME", "AGE"})})//jpa 
@NoArgsConstructor //롬복, 
@AllArgsConstructor //롬복, 
public class TestJpa {

	
	@Id@GeneratedValue
	private int seq;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date orderDate;
	
	@Enumerated(EnumType.STRING) //권한레벨정의 할때 String으로해야 타입이증가할때 DB처리안해도됨.
	private TestJpaEnum status;
	
	@Column
	public int Id;
	
	@Column(name = "testString", nullable= false, length=10) //컬럼명정의, 널허용처리, 컬럼의길이정의
	public String testString;
	
	
}
