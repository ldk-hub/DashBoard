package com.com.gentelella.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.com.vo.DashBoardVO;

@Repository
public class DashBoardDAO extends SqlSessionDaoSupport {
	
    @Resource(name="sqlSessionFactory")
	public void setSuperSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
		super.setSqlSessionFactory(sqlSessionFactory);
	}

    public List<DashBoardVO> selectBoardList(DashBoardVO dashBoardVO) throws Exception {
		return getSqlSession().selectList("dashBoardMapper.selectBoardList", dashBoardVO);
	}
}

