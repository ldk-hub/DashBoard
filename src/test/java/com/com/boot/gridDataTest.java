package com.com.boot;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

import com.com.gentelella.repository.CustomRepository;
import com.com.gentelella.service.DashBoardService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class gridDataTest {
	 
	Scanner sc = new Scanner(System.in);
	
	@Autowired
	CustomRepository	customRepository;
	@Autowired
	DashBoardService dashBoardService;
	
	@Test
	public void multiChart2(@RequestParam Map<String, String> paramMap) throws Exception {
		System.out.println("별도 JPQL 쿼리 호출 방식 @@@@@@@@@@@@@@@@@"+customRepository.findByTitle());
		System.out.println("별도 JPQL 쿼리 호출 방식 @@@@@@@@@@@@@@@@@"+dashBoardService.multiChart2(paramMap));// 마이바티스 데이터 호출
		
	}
	@Test
	//대시보드 리스트 호출 
	public Object test(@RequestParam Map<String, String> paramMap, ModelMap map) throws Exception {
		return resultData(dashBoardService.selectBoardList(paramMap),paramMap);
	}
	
	
	@Test
	//그리드 배열 가공 양식
	public Object resultData(List<Object> list, Map<String, String> paramMap) throws JsonProcessingException, SQLException{
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
		
		@Test
		public HashMap<String, Integer> delGrid(@RequestParam Map<String,String> paramMap) throws Exception {
			String Test = paramMap.get("delParam");
			ObjectMapper mapper = new ObjectMapper();
			try {
				List<Map<String, Object>> data= mapper.readValue(Test,new TypeReference<List<Map<String, Object>>>(){});
					for(int i = 0; i<data.size(); i++) {
						
						System.out.println(data.get(i));
						dashBoardService.delGrid(data.get(i));
					}
					}catch(IOException e) {
						e.printStackTrace();
				}
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("code",1);
			return map;
		}
	

}
