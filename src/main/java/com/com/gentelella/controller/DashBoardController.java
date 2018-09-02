package com.com.gentelella.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hyperic.sigar.CpuPerc;
import org.hyperic.sigar.Mem;
import org.hyperic.sigar.Sigar;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.com.gentelella.service.DashBoardServiceImpl;
import com.com.gentelella.smtp.Email;
import com.com.gentelella.smtp.EmailSender;
import com.com.gentelella.vo.DashBoardVO;



@Controller
public class DashBoardController {

	@Autowired
	DashBoardServiceImpl dashBoardService;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email email;
	
	// 스프링부트 시작시 logback 사용가능함 base.xml에서 로그레벨 설정할 것
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	// 뷰패스를 지정해서 영역분리 및 편의기능
	private static final String VIEW_PATH = "dashboard/"; //실사용 페이지
	private static final String VIEW_PATH2 = "itemsample/";//커스텀용 페이지

	// VIEW_PATH 서비스제공 페이지
	// 메인페이지
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Model model)throws Exception{
		//로그인한 유저정보
	    User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("현재로그인 : " + user.getUsername());
		return VIEW_PATH + "dashboard";
	}
	
	//CPU차트 데이터 전송(수정중)
	@RequestMapping(value = "/myChart", method = RequestMethod.GET)
	@ResponseBody
	public String myChart(Model model)throws Exception{
	//cpu점유율 측정(차트로 퍼센 테이지 호출 예정)
		System.out.println("================== CPU정보 ====================");
		JSONObject cpuObj = new JSONObject();
		Sigar sigar = new Sigar(); 
		CpuPerc cpu = null; 
			try {
				//cpu측정 영역
				cpu = sigar.getCpuPerc();
						System.out.println(String.format("Cpu점유율 -> 사용중 : %s / 시스템 : %s / 아이들  : %s ",
					CpuPerc.format(cpu.getUser()), CpuPerc.format(cpu.getSys()), CpuPerc.format(cpu.getIdle())));
					cpuObj.put("cpuInfo",CpuPerc.format(cpu.getIdle()));
						//System.out.println(cpuObj.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		return cpuObj.toString();
	}
	
	//메모리 차트 데이터 전송(수정중)
	@RequestMapping(value = "/myChart2", method = RequestMethod.GET)
	@ResponseBody
	public String myChart2(Model model)throws Exception{
		JSONObject memObj = new JSONObject();
		Sigar sigar1 = new Sigar();//메모리
		Mem mem = null;//memory
		String pattern = "####.##";//memory
			try {
					//메모리측정 영역
					mem = sigar1.getMem();
					 //KB -> GB 변환 
					Double totalCPU = (double) mem.getTotal() / 1000000000;
					Double usedCPU = (double) mem.getUsed() / 1000000000;
					Double freeCPU = (double) mem.getFree() / 1000000000;
					DecimalFormat df = new DecimalFormat(pattern);
					System.out.println(String.format("Memory점유율 ->  총 : %s / 사용중 : %s / 대기중 : %s ",
							String.valueOf(df.format(totalCPU) + " GB"),
							String.valueOf(df.format(usedCPU) + " GB"),
							String.valueOf(df.format(freeCPU) + " GB")));
			} catch (Exception e) {
				e.printStackTrace();
			}
		return memObj.toString();
	}
		
	// 일정관리페이지
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar(Model model) throws Exception {
			return VIEW_PATH + "calendar";
	}
	//일정목록 호출
	@RequestMapping(value = "/scheduleList", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, String>> calendarList(Model model) throws Exception {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			return dashBoardService.getScheduleArticles(paramMap);
	}
	//일정 등록
	@RequestMapping(value = "/scheduleInsert", method = RequestMethod.GET)
	@ResponseBody
	public int scheduleInsert(Model model) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
			return dashBoardService.scheduleInsert(paramMap);
	}
	//일정삭제
	@RequestMapping(value = "/scheduleDelete", method = RequestMethod.GET)
	@ResponseBody
	public void scheduleDelete(Model model) throws Exception {
		 dashBoardService.scheduleDelete(model);
	}
	// 의뢰용 페이지
	@RequestMapping(value = "/hyopage", method = RequestMethod.GET)
	public String hyopage(ModelMap map, DashBoardVO dashBoardVO) throws Exception {
		List<DashBoardVO> resultList = dashBoardService.selectBoardList(dashBoardVO);
		map.put("list", resultList);
		return VIEW_PATH + "hyopage";
	}
	// 회원정보 확인페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Model model) {
		return VIEW_PATH + "mypage";
	}
	//SMTP 패스워드 찾기
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model) {
		return VIEW_PATH2 + "form";
	}
	
		//SMTP 비밀번호 찾기 메일전송 현재 프로퍼티에 계정정보 누출가능성을 염두하여 테스트만진행 후 디폴트값으로 바꿈
		@RequestMapping(value = "/sendPw.do")
		public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		   	ModelAndView mav;
		    String id=(String) paramMap.get("userId");
		    String e_mail=(String) paramMap.get("email");
		    //위의 회원정보를 통해 패스워드 정보 가져옴
		    String pw=dashBoardService.getPw(paramMap);
		    System.out.println(pw);
		    if(pw!=null) {
		    	//이메일 전달 내용
		        email.setContent("비밀번호는 "+pw+" 입니다.");
		        //이메일 전달받을 계정
		        email.setReceiver(e_mail);
		        //이메일 전송 제목
		        email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
		        //이메일 보낸 사람
		        emailSender.SendEmail(email);
		        mav= new ModelAndView("redirect:/login.do");
		    return mav;
		    }else {
		    mav=new ModelAndView("redirect:/logout.do");
		         return mav;
		    }
		}
}
