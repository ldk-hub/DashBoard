package com.com.gentelella.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.com.gentelella.vo.DashBoardVO;

@Repository
public class DashBoardDAO extends SqlSessionDaoSupport {
	
    @Resource(name="sqlSessionFactory")
	public void setSuperSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
		super.setSqlSessionFactory(sqlSessionFactory);
	}

    public List<Object> selectBoardList(Map<String, String> paramMap) throws Exception {
		return getSqlSession().selectList("dashBoardMapper.selectBoardList", paramMap);
	}
    //smtp이메일
	public String getPw(Map<String, Object> paramMap) throws Exception {
		return getSqlSession().selectOne("dashBoardMapper.getPw", paramMap);
	}
	//일정 목록 
	public List<Map<String, String>> getScheduleArticles(Map<String, Object> paramMap)throws Exception  {
	List<Map<String, String>> scheduleArticle = getSqlSession().selectList("dashBoardMapper.scheduleList", paramMap);
		return scheduleArticle.size()==0?new ArrayList<Map<String,String>>():scheduleArticle;
	}
	//일정 등록
	public int scheduleInsert(Map<String, Object> paramMap) throws Exception {
		return getSqlSession().insert("dashBoardMapper.scheduleInsert", paramMap);
	}
	//일정 삭제
	public void scheduleDelete(Model model) throws Exception {
		getSqlSession().delete("dashBoardMapper.scheduleDelete", model);
	}
	//카운트
	public int totalUser(Model model) throws Exception {
		return getSqlSession().selectOne("dashBoardMapper.totalUser", model);
	}
	
	public int countMale(Model model) throws Exception {
		return getSqlSession().selectOne("dashBoardMapper.countMale", model);
	}
	
	public int countFemale(Model model) throws Exception {
		return getSqlSession().selectOne("dashBoardMapper.countFemale", model);
	}
	
	public List<Object> schedule(Model model) throws Exception {
		return getSqlSession().selectList("dashBoardMapper.schedule", model);
	}
	 
	public int listDataCount(Model model) throws Exception {
		return getSqlSession().selectOne("dashBoardMapper.listDataCount", model);
	}

	public int delGrid(Map<String, Object> map)throws Exception {
		return getSqlSession().delete("dashBoardMapper.deleteGrid", map);
	}

	public int insertSchedule(Map<String, String> paramMap)throws Exception {
		return getSqlSession().insert("dashBoardMapper.insertSchedule", paramMap);
	}

	public List<Object> DashboardList(Map<String, String> paramMap)throws Exception {
		return getSqlSession().selectList("dashBoardMapper.DashboardList", paramMap);
	}
	
	public List<Object> multiChart2(Map<String, String> paramMap)throws Exception {
		return getSqlSession().selectList("dashBoardMapper.multiChartData", paramMap);
	}
	 
}

