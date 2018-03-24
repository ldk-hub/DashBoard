package com.com.boot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DashBoardController {

	//스프링부트 시작시 logback 사용가능함 base.xml에서 로그레벨 설정할 것
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	//@RequestMapping(value = "/", method = RequesMethod.GET)
	public String getHome() {
		logger.debug("logback example - debug level");
		logger.info("logback example - info level");
		logger.warn("logback example - warn level");

		return "Hello Test!!!!!!";
	}
	
}
