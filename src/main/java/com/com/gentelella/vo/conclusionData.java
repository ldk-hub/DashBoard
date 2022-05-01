package com.com.gentelella.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name="CONCLUSION_TABLE")
public class conclusionData {

	
	@Id
	@GeneratedValue
	private Long seq;
	
	@Column
	private String clusion_time; //체결시간
	private String coin_code; //종목코드
	private Long clusion_price; //체결가격
	private Long clusion_count; //체결량
	private String clusion_total; //체결금액
	
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date clusionDate; //거래발생시간
	
}
