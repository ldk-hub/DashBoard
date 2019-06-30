package com.com.gentelella.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.com.gentelella.service.ScheduleSendService;



//스케줄러 기능 추가 10분단위로 시스템 check 및 갱신
//활용목적 웹에서 주기적 시간마다 체크해야하는 비즈니스 로직필요시 사용
//예를들면 시간제 예약 시스템 -> 지정한 시간이 도래하였을때 지정한 플로우를 탈수있게끔 
@Component
public class ScheduleCron {
	
	@Autowired
	ScheduleSendService scheduleSendService;
	
	//10분단위 설정
  @Scheduled(cron = "0 0/10 * * * *")
  //@Scheduled(cron = "*/30 * * * * *")
  public void aJob() throws Exception {

  	SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
  	Date now = new Date();
  	String time = format1.format(now);
  	int chk_data = scheduleSendService.scheduleChkCntData(null);
  	
  	if(chk_data > 0) {
  		scheduleSendService.scheduleDateSet(time);
  	}
  }
}