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
@Entity(name ="COIN_UP_DATA")
@NoArgsConstructor
public class CoinData {

	
	@Id
	 @GeneratedValue
	private Long seq;
	@Column
	private String name;
	private String data;
	
	@Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
	
}
