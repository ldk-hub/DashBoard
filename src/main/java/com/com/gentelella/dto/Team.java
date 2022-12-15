package com.com.gentelella.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Getter;

@Entity
@Getter
public class Team {
	@Id@GeneratedValue
	private int seq;
	
	private String name;
}
