package com.com.gentelella.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.com.gentelella.dao.DashBoardDAO;

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
	
	//회원정보 총집계
	public int totalUser(Model model) throws Exception {
		return dashBoardDAO.totalUser(model);
	}
	//남자회원집계
	public int countMale(Model model) throws Exception {
		return dashBoardDAO.countMale(model);
	}
	//여성회원집계
	public int countFemale(Model model) throws Exception {
		return dashBoardDAO.countFemale(model);
	}
	//스케줄링 로직
	public List<Object> schedule(Model model) throws Exception {
		return dashBoardDAO.schedule(model);
	}
	//목록정보 집계
	public int listDataCount(Model model) throws Exception {
		return dashBoardDAO.listDataCount(model);
	}
	//그리드API 삭제처리로직
	public int delGrid(Map<String, Object> map)throws Exception {
		return dashBoardDAO.delGrid(map);
	}
	//스케쥴 등록
	public int insertSchedule(Map<String, String> paramMap)throws Exception {
		return dashBoardDAO.insertSchedule(paramMap);
	}
    //메인대시보드 리스트 정보호출
	public List<Object> DashboardList(Map<String, String> paramMap)throws Exception {
		return dashBoardDAO.DashboardList(paramMap);
	}
	//메인페이지 라인차트 정보 호출
	public List<Object> multiChart2(Map<String, String> paramMap)throws Exception {
		return dashBoardDAO.multiChart2(paramMap);
	}
	
	public int insertInfo(Map<String, Object> paramMap)throws Exception {
		return dashBoardDAO.insertInfo(paramMap);
	}

	public int updateInfo(Map<String, Object> paramMap)throws Exception {
		return dashBoardDAO.updateInfo(paramMap);
	}

	@Override
	public void insertFileInfo(Map<String, Object> upload_map) throws Exception {
		dashBoardDAO.insertFileInfo(upload_map);
	}

}
