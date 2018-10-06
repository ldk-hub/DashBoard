package com.com.gentelella.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.com.gentelella.vo.DashBoardVO;

@Repository
public class DashBoardDAO extends SqlSessionDaoSupport {
	
    @Resource(name="sqlSessionFactory")
	public void setSuperSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
		super.setSqlSessionFactory(sqlSessionFactory);
	}

    public List<DashBoardVO> selectBoardList(DashBoardVO dashBoardVO) throws Exception {
		return getSqlSession().selectList("dashBoardMapper.selectBoardList", dashBoardVO);
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
	public int totalUser(DashBoardVO dashBoardVO) throws Exception {
		return getSqlSession().totalUser("dashBoardMapper.totalUser", dashBoardVO);
	}
	
	public int countMale(DashBoardVO dashBoardVO) throws Exception {
		return getSqlSession().countMale("dashBoardMapper.countMale", dashBoardVO);
	}
	
	public int countFemale(DashBoardVO dashBoardVO) throws Exception {
		return getSqlSession().countFemale("dashBoardMapper.countFemale", dashBoardVO);
	}
	
}

