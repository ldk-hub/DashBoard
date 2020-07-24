package com.com.gentelella.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.com.gentelella.vo.MainData;

public interface CustomRepository extends JpaRepository<MainData, Long> {

}
