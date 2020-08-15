package com.com.gentelella.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


public interface DashBoardService {

	public List<Object> selectBoardList(Map<String, String> paramMap) throws Exception;

	public String getPw(Map<String, Object> paramMap) throws Exception;

	public List<Map<String, String>> getScheduleArticles(Map<String, Object> paramMap) throws Exception;
	
	
	public void scheduleDelete(Model model) throws Exception;
	
	public int totalUser(Model model) throws Exception;
	
	public int countMale(Model model) throws Exception;
	
	public int countFemale(Model model) throws Exception;
	
	public  List<Object> schedule(Model model) throws Exception;
	
	public int listDataCount(Model model) throws Exception;
	
	public int delGrid(Map<String, Object> map)throws Exception;
	
	
	public int insertSchedule(Map<String, String> paramMap) throws Exception;
	
	public List<Object> multiChart2(Map<String, String> paramMap) throws Exception;
	 //이미지 정보 삽입
	public void insertFileInfo(Map<String, Object> upload_map) throws Exception;
		
}
