package com.com.gentelella.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Builder //파라미터값을 쉽게넣어줌
@ToString //객체의 값체크
@AllArgsConstructor //생성자 자동완성
@NoArgsConstructor
@Entity(name="COIN_HOGA_TABLE")
public class CoinHogaData {

	@Id
	@GeneratedValue
	private Long seq;
	
	//매수,매도 정보
	@Column
	private String coin_name; //종목명
	private String coin_code; //종목코드
	private long hoga_data; //매수,매도 호가
	private long total_price; //주문총액
	private long stock_price; //주문단가
	private long stock_count; //주문수량
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date hogaDate;
}
