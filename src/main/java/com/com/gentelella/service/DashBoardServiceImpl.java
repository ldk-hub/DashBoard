package com.com.gentelella.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.com.gentelella.dao.DashBoardDAO;
import com.com.gentelella.vo.DashBoardVO;

@Service
public class DashBoardServiceImpl implements DashBoardService  {

	@Autowired
	DashBoardDAO dashBoardDAO;
	//의뢰페이지 목록
	public List<Object> selectBoardList(Map<String, String> paramMap)throws Exception {
		return dashBoardDAO.selectBoardList(paramMap);
	}

	//패스워드 분실
	@Override
	public String getPw(Map<String, Object> paramMap) throws Exception {
		return dashBoardDAO.getPw(paramMap);
	}
	
	
	//일정 목록 
	@Override
	public List<Map<String, String>> getScheduleArticles(Map<String, Object> paramMap) throws Exception {
		return dashBoardDAO.getScheduleArticles(paramMap);
	}
	//일정 등록
	public int scheduleInsert(Map<String, Object> paramMap) throws Exception {
		return dashBoardDAO.scheduleInsert(paramMap);
	}
	//일정 삭제
	public void scheduleDelete(Model model) throws Exception {
		dashBoardDAO.scheduleDelete(model);
	}
	
	
	public int totalUser(Model model) throws Exception {
		return dashBoardDAO.totalUser(model);
	}
	public int countMale(Model model) throws Exception {
		return dashBoardDAO.countMale(model);
	}
	public int countFemale(Model model) throws Exception {
		return dashBoardDAO.countFemale(model);
	}
	
	public List<Object> schedule(Model model) throws Exception {
		return dashBoardDAO.schedule(model);
	}
	
	public int listDataCount(Model model) throws Exception {
		return dashBoardDAO.listDataCount(model);
	}

	public int delGrid(Map<String, Object> map)throws Exception {
		return dashBoardDAO.delGrid(map);
	}
	//스케쥴 등록
	public int insertSchedule(Map<String, String> paramMap)throws Exception {
		return dashBoardDAO.insertSchedule(paramMap);
	}

	public List<Object> DashboardList(Map<String, String> paramMap)throws Exception {
		return dashBoardDAO.DashboardList(paramMap);
	}

	public List<Object> multiChart2(Map<String, String> paramMap)throws Exception {
		return dashBoardDAO.multiChart2(paramMap);
	}



}
