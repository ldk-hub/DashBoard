package com.com.gentelella.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.com.gentelella.dto.Team;
import com.com.gentelella.dto.TestJoinJpa;

public class TestJoinFetchJPA {
	public static void main(String[] args) {
		
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpaTest");
		EntityManager em = emf.createEntityManager();

		TestJoinJpa tjpa = em.find(TestJoinJpa.class, "member1");
		Team tjj = tjpa.getTeam();

		System.out.println("jpa 지연로딩 테스트코드:" + tjj.getName());
	}

}
