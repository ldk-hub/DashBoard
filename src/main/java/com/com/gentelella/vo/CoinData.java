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
@Entity(name="COIN_LIST_TABLE")
public class CoinData {

	
	@Id
	@GeneratedValue
	private Long seq;
	
	//상장종목 정보
	@Column
	private String coin_name; //종목명
	private String coin_code; //종목코드
	private Long total_price; //주문총액
	private Long stock_price; //주문단가
	private String stock_count; //주문수량
	
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;

}
