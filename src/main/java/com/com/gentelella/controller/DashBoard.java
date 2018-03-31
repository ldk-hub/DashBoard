package com.com.gentelella.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DashBoard {

	//스프링부트 시작시 logback 사용가능함 base.xml에서 로그레벨 설정할 것
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
    private static final String VIEW_PATH = "dashboard/";
	
    @RequestMapping( value = "/dashboard", method = RequestMethod.GET )
    public String dashboard(Model model)
    {
        return VIEW_PATH + "dashboard";
    }
	
}



