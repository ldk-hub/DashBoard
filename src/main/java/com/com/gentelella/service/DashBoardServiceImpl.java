package com.com.gentelella.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com.gentelella.dao.DashBoardDAO;
import com.com.vo.DashBoardVO;

@Service
public class DashBoardServiceImpl implements DashBoardService  {

	@Autowired
	DashBoardDAO dashBoardDAO;
	
	public List<DashBoardVO> selectBoardList(DashBoardVO dashBoardVO)throws Exception {
		return dashBoardDAO.selectBoardList(dashBoardVO);
	}

	
	@Override
	public String getPw(Map<String, Object> paramMap) throws Exception {
		return dashBoardDAO.getPw(paramMap);
	}
}
