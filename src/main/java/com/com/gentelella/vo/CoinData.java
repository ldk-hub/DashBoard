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
	
	//필요정보
	//종목명, 현재가, 전일대비, 거래대금
	//체결시간, 체결가격, 체결량, 체결금액
	//코인명, 코인코드, 주문가격, 수량, 주문총액
	
	
	@Column
	private String coin_name; //종목명
	private String coin_code; //종목코드
	private Long total_price; //주문총액
	private Long stock_price; //주문단가
	private String stock_count; //주문수량
	
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;

}
