package com.com.gentelella.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com.gentelella.mapper.DashBoardMapper;

@Service
public class DashBoardService {

	@Autowired
	DashBoardMapper dashBoardMapper;

	public List<Map<String, Object>> selectBoardList() {
		List<Map<String, Object>> resultList = dashBoardMapper.selectBoardList();
		return resultList;
	}
	
}
