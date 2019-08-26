package com.com.gentelella.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


import lombok.Data;
@Entity
@Table(name="ap_role")
@Data
public class Role {
  @Id
  @GeneratedValue
  private Long id;
  private String name;
 
  public Role(){
  }
  
  public Role(String name){
    this.name = name;
  }
}


