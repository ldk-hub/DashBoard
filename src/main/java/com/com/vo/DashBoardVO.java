package com.com.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class DashBoardVO {
	@Getter
	@Setter
	private int certNo;
	private String itemNo;
	private String itemName;
	private String brdName;
	private String reason;
	private String status;
}
