package com.com.gentelella.configuration;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
public class DataBaseConfig {
	
	//sqlSession 정의 
	//스프링부트의 mapper.xml의 경로를 지정해준다.
	//bean설정을 class에서 처리해야하는 부분이 스프링과 스프링부트의 차이점
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource datasource)throws Exception{
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(datasource);
		sqlSessionFactory.setMapperLocations(new 
				PathMatchingResourcePatternResolver().getResources("classpath:/mappers/*.xml"));
		
		return(SqlSessionFactory) sqlSessionFactory.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory){
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}
