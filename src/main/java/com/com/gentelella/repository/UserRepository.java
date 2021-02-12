package com.com.gentelella.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.com.gentelella.vo.User;
//유저정보 호출jpa
public interface UserRepository extends JpaRepository<User,Long>{

	//기존회원가입
	//User findByUsername(String username);
	
	Optional<User> findByUsername(String username);

	
}
