package com.com.gentelella.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.com.gentelella.vo.MainData;

public interface CustomRepository extends JpaRepository<MainData, Long> {
	
	//동적처리 관련 테스트용 JPQL 호출 네이티브 쿼리 호출시 꼭 뒤에 옵션 걸어줘야함.
	@Query(value= "SELECT seq, date, name, temp1, temp2, used FROM multi_data", nativeQuery = true )
	List<MainData> findByTitle(); //컨트롤러에서 findByTitle로 해당 쿼리 호출 MainData에서 해당 컬럼 맵핑한 조건내에서만 호출가능
	
	//@NameQuery보다 간결하고 깔끔해서 이방법을 권장
}
