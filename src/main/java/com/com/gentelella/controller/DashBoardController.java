package com.com.gentelella.controller;

import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class DashBoardController {

	//스프링부트 시작시 logback 사용가능함 base.xml에서 로그레벨 설정할 것
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
    private static final String VIEW_PATH = "dashboard/";
    private static final String VIEW_PATH2 = "itemsample/";
	
    
    //로그인 페이지
    @RequestMapping( value = "/login", method = RequestMethod.GET )
    public String login(Model model)
	    {
	        return  "login";
	    }
    
    
    
    //VIEW_PATH 구현한 페이지 
    @RequestMapping( value = "/dashboard", method = RequestMethod.GET )
    public String dashboard(Model model)
	    {
	        return VIEW_PATH + "dashboard";
	    }
    
    @RequestMapping( value = "/calendar", method = RequestMethod.GET )
    public String calendar(Model model)
	    {
	        return VIEW_PATH + "calendar";
	    }
    @RequestMapping( value = "/hyopage", method = RequestMethod.GET )
    public String hyopage(Model model)
	    {
	        return VIEW_PATH + "hyopage";
	    }
    
    
    
    //VIEW_PATH2 개발용 기타 API 샘플 페이지
    @RequestMapping( value = "/chartjs", method = RequestMethod.GET )
    public String chartjs(Model model)
	    {
	        return VIEW_PATH2+ "chartjs";
	    }
    @RequestMapping( value = "/chartjs2", method = RequestMethod.GET )
    public String chartjs2(Model model)
	    {
	        return VIEW_PATH2+ "chartjs2";
	    }
    @RequestMapping( value = "/echarts", method = RequestMethod.GET )
    public String echarts(Model model)
	    {
	        return  VIEW_PATH2+ "echarts";
	    }
    @RequestMapping( value = "/icons", method = RequestMethod.GET )
    public String icons(Model model)
	    {
	        return  VIEW_PATH2+ "icons";
	    }
    @RequestMapping( value = "/form", method = RequestMethod.GET )
    public String form(Model model)
	    {
	        return  VIEW_PATH2+ "form";
	    }
   
}



