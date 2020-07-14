package com.com.boot;

import static org.junit.Assert.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class gridDataTest {

	@Test
	public void test() {
		
		/*//대시보드 리스트 호출 가공
		public Object test(@RequestParam Map<String, String> paramMap, ModelMap map) throws Exception {
			return resultData(dashBoardService.DashboardList(paramMap),paramMap);
		}
		
			//그리드 양식 가공
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
			
			//그리드 체크 로우삭제
			@RequestMapping(value = "/delGrid", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
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
			}*/

		fail("Not yet implemented");
	}

}
