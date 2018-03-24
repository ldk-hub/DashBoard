package com.com.jpa;

import lombok.Data;

@Data
public class Item {
	/*
	 * 롬복 기능 자동 Getter Setter을 통해  시간 단축 up 
	 * POJO Class의 member 변수만 선언하면 자동으로 빌드
	 * @Data
	 */
	private String name;
	private int prince;
}
