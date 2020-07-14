package com.com.gentelella.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
    //일반적으로 키(primary key)를 가지는 변수에 선언합니다. @GeneratedValue 어노테이션은 해당 Id 값을 어떻게 자동으로 생성할지 전략을 선택할 수 있습니다.
    @GeneratedValue(strategy = GenerationType.AUTO)//
    private Long seq;
   
	/*선언은 꼭 필요한 것은 아닙니다. 
	    하지만 그것과 별개로 @Column에서 지정한 멤버 변수와 데이터베이스의 컬럼명을 다르게 주고 싶다면 @Column(name="XXX") 
	    같은 형식으로 작성해주면 됩니다. 그렇지 않으면 기본적으로 멤버 변수명과 일치하는 데이터베이스의 컬럼을 매핑합니다.*/
    @Column
    private String ITEM_NUMBER;
    @Column
    private String BRAND_NAME;
    @Column
    private String SEASON_REASON;
    @Column
    private String STATUS;
    
    public Long getSeq() {
		return seq;
	}
	public void setSeq(Long seq) {
		this.seq = seq;
	}
	public String getITEM_NUMBER() {
		return ITEM_NUMBER;
	}
	public void setITEM_NUMBER(String iTEM_NUMBER) {
		ITEM_NUMBER = iTEM_NUMBER;
	}
	public String getBRAND_NAME() {
		return BRAND_NAME;
	}
	public void setBRAND_NAME(String bRAND_NAME) {
		BRAND_NAME = bRAND_NAME;
	}
	public String getSEASON_REASON() {
		return SEASON_REASON;
	}
	public void setSEASON_REASON(String sEASON_REASON) {
		SEASON_REASON = sEASON_REASON;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

}
