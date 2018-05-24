package com.com.gentelella.controller;


import org.springframework.data.repository.CrudRepository;

import com.com.vo.Member;

public interface MemberRepository extends CrudRepository<Member, Long> {

	Object findByUemail(String email);

	
}
