package com.com.gentelella.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.com.gentelella.vo.User;

public interface UserRepository extends JpaRepository<User,Long>{

	public User findByUsername(String username);
}
