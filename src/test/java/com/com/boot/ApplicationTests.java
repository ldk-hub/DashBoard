package com.com.boot;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.com.gentelella.repository.UserRepository;



@RunWith(SpringRunner.class)
@SpringBootTest
public class ApplicationTests {
	@Autowired
	UserRepository userRepository;
	
	@Test
	public void contextLoads() {
		
		
	}

	
	@Test
	public void findAll() {
		userRepository.findAll();
		
	}
	
}
