package com.com.gentelella.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.com.gentelella.dao.DashBoardDAO;

@Repository("dashBoardMapper")
public class DashBoardMapper extends DashBoardDAO {
	public List<Map<String, Object>> selectBoardList() {
		return (List<Map<String,Object>>)selectList("dashBoardMapper.selectBoardList");
	}
}
