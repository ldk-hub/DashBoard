package com.com.gentelella.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "AP_STATISTIC")
public class MainData {
	@Id
    //일반적으로 키(primary key)를 가지는 변수에 선언합니다. 
	//@GeneratedValue 어노테이션은 해당 Id 값을 어떻게 자동으로 생성할지 전략을 선택할 수 있음
    @GeneratedValue(strategy = GenerationType.AUTO)//
    private Long seq;
   
	/*  @Column에서 지정한 멤버 변수와 데이터베이스의 컬럼명을 다르게 주고 싶다면 @Column(name="XXX") 
	    같은 형식으로 작성해주면 됩니다. 그렇지 않으면 기본적으로 멤버 변수명과 일치하는 데이터베이스의 컬럼을 매핑*/
    @Column(name="item_number", nullable = false) //nullable은 false시 낫널조건주는거임
    private String item;
    @Column(name="brand_name" ,length = 20) //길이 제약조건 length주면됨.
    private String brand;
    @Column(name="season_reason")
    private String season;
    @Column(name="status")
    private String status;
    @Column(name="test")
    private String test;
    //날짜 
    @Temporal(TemporalType.DATE)
    private Date date;
    @Temporal(TemporalType.TIME)
    private Date time;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp;
    //CLOB,BLOB 맵핑
    @Lob
    private byte[] blob;
    @Lob
    private String clob;
   
}
