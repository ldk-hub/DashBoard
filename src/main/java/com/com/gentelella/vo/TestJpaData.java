package com.com.gentelella.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;
@Data
@Entity
@Table(name = "Test")
public class TestJpaData {
	
		@Id
	    //일반적으로 키(primary key)를 가지는 변수에 선언합니다. 
		//@GeneratedValue 어노테이션은 해당 Id 값을 어떻게 자동으로 생성할지 전략을 선택할 수 있음
	    @GeneratedValue(strategy = GenerationType.AUTO)//
	    private Long seq;
		
		/*  @Column에서 지정한 멤버 변수와 데이터베이스의 컬럼명을 다르게 주고 싶다면 @Column(name="XXX") 
		    같은 형식으로 작성해주면 됩니다. 그렇지 않으면 기본적으로 멤버 변수명과 일치하는 데이터베이스의 컬럼을 매핑*/
	    @Column(name="item_number", nullable = true) //nullable은 false시 낫널조건주는거임
	    private String item;
	    @Column(name="brand_name" ,length = 20) //길이 제약조건 length주면됨.
	    private String brand;
	    @Column(name="season_reason")
	    private String season;
	    @Column(name="status")
	    private String status;
	    @Column(name="test")
	    private String test;
	    
	    //날짜 
	    @Temporal(TemporalType.DATE)
	    private Date date;
	    @Temporal(TemporalType.TIME)
	    private Date time;
	    @Temporal(TemporalType.TIMESTAMP)
	    private Date timestamp;
	    
	    //CLOB,BLOB 맵핑
	    @Lob
	    private byte[] blob;
	    @Lob
	    private String clob;
	    
	    
	    
	    //1.유저정보랑 이정보랑 조인해서 데이터 가져와보기
	    //2.양방향조회이용해서 역방향 조회해보기
	    //3. jpql 구현해보기 fetch로 조인해서 한방에가져오기 lazy옵션준상태에서<<페치조인
	         //단순쿼리, 조인, 페치조인,페이징 api
	    //4. spring jpa, querydsl 공부해야됨.
	    
	    //테이블 조인 연관관계 조회 단방향 맵핑방식
	    //초기 설계시 단방향 위주로 설계를 한다. 그다음 양방향 조건이 필요할떄 추가하면됨.
	    //@ManyToOne(fetch = FetchType.LAZY)// LAZY지연로딩 설정 ,EAGER 현업에서는 레이지로 만 설정할것
	    //@JoinColumn(name = "ap_schedule")
	    //private ap_schedule team;
	    
	    
	    //양방향 객체 연관관계 매우중요함. 
	    //@OneToMany(mappedBy = "team") //mappedBy <<연관관계의 두개의객체 내의 1개만 업데이트시키겠다는 선언문 mappedBy선언한 값의 수정가능 mappedBy쓰면 다른객체는 조회만됨. 외래키가있는곳을 주인으로함. 
	   // private List<Member> = members = new ArrayList<>();
	    
	  
		public Long getSeq() {
			return seq;
		}
		public void setSeq(Long seq) {
			this.seq = seq;
		}
		public String getItem() {
			return item;
		}
		public void setItem(String item) {
			this.item = item;
		}
		public String getBrand() {
			return brand;
		}
		public void setBrand(String brand) {
			this.brand = brand;
		}
		public String getSeason() {
			return season;
		}
		public void setSeason(String season) {
			this.season = season;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getTest() {
			return test;
		}
		public void setTest(String test) {
			this.test = test;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public Date getTime() {
			return time;
		}
		public void setTime(Date time) {
			this.time = time;
		}
		public Date getTimestamp() {
			return timestamp;
		}
		public void setTimestamp(Date timestamp) {
			this.timestamp = timestamp;
		}
		public byte[] getBlob() {
			return blob;
		}
		public void setBlob(byte[] blob) {
			this.blob = blob;
		}
		public String getClob() {
			return clob;
		}
		public void setClob(String clob) {
			this.clob = clob;
		}
	    
	    
	   
	}
