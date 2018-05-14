package com.com.gentelella.service;

import java.util.List;

import com.com.vo.DashBoardVO;

public interface DashBoardService {
	
	public List<DashBoardVO> selectBoardList(DashBoardVO dashBoardVO)throws Exception;
	
}
