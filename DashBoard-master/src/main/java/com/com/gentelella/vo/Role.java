package com.com.gentelella.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


import lombok.Data;

@Data
@Entity
@Table(name="ap_role")
public class Role {
	
	
  @Id
  @GeneratedValue
  private Long id;
  private String name;
  
	  public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

 
	  public Role(){
	  }
	  
	  public Role(String name){
	    this.name = name;
	  }
}


