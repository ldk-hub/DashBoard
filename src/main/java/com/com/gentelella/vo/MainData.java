package com.com.gentelella.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Data
@Entity
@Table(name = "MULTI_DATA")
public class MainData {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long seq;
	@Column(name="name", nullable = true) //nullable은 false시 낫널조건주는거임
    private String name;
    @Column(name="temp1" ,length = 20) //길이 제약조건 length주면됨.
    private String free;
    @Column(name="temp2")
    private String total;
    @Column(name="used")
    private String used;
    @Column(name="date")
    private Date date;
 
    public Long getSeq() {
		return seq;
	}
	public void setSeq(Long seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFree() {
		return free;
	}
	public void setFree(String free) {
		this.free = free;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getUsed() {
		return used;
	}
	public void setUsed(String used) {
		this.used = used;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
