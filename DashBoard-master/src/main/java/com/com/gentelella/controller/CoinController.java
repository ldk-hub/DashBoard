package com.com.gentelella.controller;



import org.springframework.context.annotation.Profile;

import org.springframework.stereotype.Controller;



@Controller
@Profile({"dev", "real"})//리눅스 서버에서만 작동하게 프로파일 설정됨.
public class CoinController {
			
	
}


