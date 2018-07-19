package com.com.gentelella.service;

import java.util.List;
import java.util.Map;

import com.com.gentelella.vo.DashBoardVO;

public interface DashBoardService {
	
	public List<DashBoardVO> selectBoardList(DashBoardVO dashBoardVO)throws Exception;
	
	public String getPw(Map<String, Object> paramMap) throws Exception;
	
	 public List<Map<String, String>> getScheduleArticles(Map<String, Object> paramMap) throws Exception;
}
