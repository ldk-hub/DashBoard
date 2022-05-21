package com.com.gentelella.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.com.gentelella.vo.CoinData;
import com.com.gentelella.vo.CoinHogaData;

//jpaRepository extends를 하게되면 해당 레파지토리로 JPA의 대부분의 자동쿼리 기능을 사용할 수 있다.
public interface CoinRepository extends JpaRepository<CoinData, Long> {

	 
	//SELECT 파트
	//:name과 같이 앞에 : 붙ㅇ는 것으로 파라미터 지정 가능
	//@Query(value = "select name, age from sample_member where name = :name", nativeQuery = true)
	//@Param("파라미터") 데이터 타입 데이터명 이런식으로 파라미터를 받아 사용할 수 있다.
	//List<CoinData> searchParamRepo(@Param("name")String name);
	
	
	//UPDATE 파트
	
	
	
	//INSERT 파트
	void save(CoinHogaData entity);
	
	
	
	//DELETE 파트
	
	
	
}
