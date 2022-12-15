package com.com.gentelella.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUnit;

import com.com.gentelella.dto.TestJpa;
import com.com.gentelella.dto.TestJpaEnum;

public class TestUpdateJpa {

	private static final TestJpaEnum ORDER = null;
	private static final TestJpaEnum CANCLE = null;
	
	@PersistenceContext
	private static EntityManagerFactory emf;

	public static void main(String[] args) {
		//트랜잭션 부분
		
		 
		EntityManager em = emf.createEntityManager();
		EntityTransaction tx = em.getTransaction();
			/*
			 * jpa로 엔티티 수정할때 단순히 엔티티를 조회해서 데이터만 변경하면 된다.
			 * 엔티티의 변경사항을 데이터베이스에 자동으로 반영하는 기능을 변경감지(더티체킹)이라한다. 
			 * 
			 * jpa는 엔티티를 영속성 컨텍스트에 보관할때 최초 상태를 복사해서 저장해두는데 이것을 스냅샷이라한다.
			 * 그리고 플러시 시점에 스냅샷과 엔티티를 비교해서 변경된 엔티티를 찾는다.
			 * 
			 *  중요한점은 영속성 컨텍스트가 관리하는 영속상태의 엔티티만 적용된다. (준영속, 비영속X)
			 */
		try {
			tx.begin();
			logic(em); 
			tx.commit();//1. 트랜잭션을 커밋 할때 엔티티 매니저 내부에서 먼저 플러시(flush())가 호출된다.
						//2 .엔티티와 스냅샷을 비교해 변경된 엔티티를 찾는다.
						//3. 변경된 엔티티가 있으면 수정 쿼리를 생성해서 쓰기 지연SQL 저장소에 보낸다.
						//4. 쓰기 지연 저장소의 SQL을 데이터베이스에보낸다.
						//5. 데이터베이스 트랜잭션을 커밋한다.

		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			em.close();
		}

	}
	
	
	//비즈니스로직 처리 부분
	private static void logic(EntityManager em) {
		String id = "id1";
		TestJpa test = new TestJpa();
		
		test.setId(2);
		test.setStatus(ORDER);
		
		em.persist(test); //저장
		test.setStatus(CANCLE);
		
		TestJpa findTester = em.find(TestJpa.class, id);
		System.out.println("findMember = " + findTester.getTestString() + "findStatus ="+ findTester.getStatus());
		
	}
}