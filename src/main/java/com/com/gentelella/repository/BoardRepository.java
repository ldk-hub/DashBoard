package com.com.gentelella.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.com.gentelella.vo.GridData;

public interface BoardRepository extends JpaRepository<GridData, Long> {

}
