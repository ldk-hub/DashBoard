package com.com.gentelella.vo;

import java.sql.Clob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "AP_STATISTIC")
@Data 
public class GridData {
    @Id
    //일반적으로 키(primary key)를 가지는 변수에 선언합니다. @GeneratedValue 어노테이션은 해당 Id 값을 어떻게 자동으로 생성할지 전략을 선택할 수 있습니다.
    @GeneratedValue(strategy = GenerationType.AUTO)//
    private Long seq;
	/*선언은 꼭 필요한 것은 아닙니다. 
    하지만 그것과 별개로 @Column에서 지정한 멤버 변수와 데이터베이스의 컬럼명을 다르게 주고 싶다면 @Column(name="XXX") 
    같은 형식으로 작성해주면 됩니다. 그렇지 않으면 기본적으로 멤버 변수명과 일치하는 데이터베이스의 컬럼을 매핑합니다.*/
    @Column
    private String brand_name;
    @Column
    private Clob clob;
    @Column
    private String item_number;
    @Column
    private String season_reason;
    @Column
    private String status;
    @Column
    private String test;
    @Column
    private Date date;
    
    public Long getSeq() {
		return seq;
	}
	public void setSeq(Long seq) {
		this.seq = seq;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public Clob getClob() {
		return clob;
	}
	public void setClob(Clob clob) {
		this.clob = clob;
	}
	public String getItem_number() {
		return item_number;
	}
	public void setItem_number(String item_number) {
		this.item_number = item_number;
	}
	public String getSeason_reason() {
		return season_reason;
	}
	public void setSeason_reason(String season_reason) {
		this.season_reason = season_reason;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTest() {
		return test;
	}
	public void setTest(String test) {
		this.test = test;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
  }

