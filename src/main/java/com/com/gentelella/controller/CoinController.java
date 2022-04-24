package com.com.gentelella.controller;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.com.gentelella.repository.BoardRepository;
import com.com.gentelella.repository.CoinRepository;
import com.com.gentelella.vo.CoinData;
import com.com.gentelella.vo.GridData;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

//거래소 페이지 처리 로직 
@Controller
@Profile({"dev", "real"})//리눅스 서버에서만 작동하게 프로파일 설정됨.
public class CoinController {
	
	@Autowired
	private CoinRepository coinRepository;
	
	// 스프링부트 시작시 logback 사용가능함 base.xml에서 로그레벨 설정할 것
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	//이곳에 코인종목리스트 추가
	
	
	@RequestMapping(value = "/selectCoinList", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/json; charset=utf8")
	@ResponseBody
	public Object selectCoinList(@RequestParam Map<String, String> paramMap, ModelMap map) throws Exception {
		//조회기능구현 완료 Mybatis -> JPA
		return resultGridData(coinRepository.findAll(),paramMap);
	}
	//JPA전용 배열 분할처리
	public Object resultGridData(List<CoinData> list, Map<String, String> paramMap) throws JsonProcessingException, SQLException{
		HashMap <String,Object> res = new HashMap <String,Object>();
		HashMap <String,Object> data = new HashMap <String,Object>();
		data.put("contents", list);
		res.put("result",true);
		res.put("data",data);
		if(list.size()>0) {
			ObjectMapper jackson = new ObjectMapper();
			String jsonString = jackson.writeValueAsString(res);
			return jsonString;
		}
		return null;
	}
	
}

