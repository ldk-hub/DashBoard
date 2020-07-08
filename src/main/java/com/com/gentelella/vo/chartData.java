package com.com.gentelella.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Table(name = "MULTI_DATA")
@Data
public class chartData {
	
    @Id
    //일반적으로 키(primary key)를 가지는 변수에 선언합니다. @GeneratedValue 어노테이션은 해당 Id 값을 어떻게 자동으로 생성할지 전략을 선택할 수 있습니다.
    @GeneratedValue(strategy = GenerationType.AUTO)//
    private Long seq;
    /*선언은 꼭 필요한 것은 아닙니다. 
    하지만 그것과 별개로 @Column에서 지정한 멤버 변수와 데이터베이스의 컬럼명을 다르게 주고 싶다면 @Column(name="XXX") 
    같은 형식으로 작성해주면 됩니다. 그렇지 않으면 기본적으로 멤버 변수명과 일치하는 데이터베이스의 컬럼을 매핑합니다.*/
    @Column
    private String name;
    @Column
    private String temp1;
    @Column
    private String temp2;
    @Column
    private String temp3;
    @CreationTimestamp
    private Date date;//생성상세날짜를 기록하고 아직 로그인정보 수정페이지 미구현으로 추후 업데이트날짜 추가
  }

