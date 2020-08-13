package com.com.gentelella.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.com.gentelella.vo.GridData;
//그리드데이터 jpa구현
public interface BoardRepository extends JpaRepository<GridData, Long> {

}
