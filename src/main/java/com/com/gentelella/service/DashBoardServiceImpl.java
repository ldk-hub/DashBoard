package com.com.gentelella.service;

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
	public List<DashBoardVO> selectBoardList(DashBoardVO dashBoardVO)throws Exception {
		return dashBoardDAO.selectBoardList(dashBoardVO);
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
	
	//카운트정보
	public int totalUser(DashBoardVO dashBoardVO) throws Exception {
		return dashBoardDAO.totalUser(dashBoardVO);
	}
	public int countMale(DashBoardVO dashBoardVO) throws Exception {
		return dashBoardDAO.countMale(dashBoardVO);
	}
	public int countFemale(DashBoardVO dashBoardVO) throws Exception {
		return dashBoardDAO.countFemale(dashBoardVO);
	}

}
