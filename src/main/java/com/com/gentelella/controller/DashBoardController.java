package com.com.gentelella.controller;

import java.io.IOException;
import java.sql.SQLException;
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
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;



@Controller
public class DashBoardController {

	@Autowired
	DashBoardServiceImpl dashBoardService;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email email;
	
	@Autowired
	private ObjectMapper objectMapper;
	
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
		//카운트정보 
		model.addAttribute("totalUser", dashBoardService.totalUser(model));
		model.addAttribute("countFemale", dashBoardService.countFemale(model));
		model.addAttribute("countMale", dashBoardService.countMale(model));
		model.addAttribute("listDataCount", dashBoardService.listDataCount(model));
		//스케쥴 리스트정보
		model.addAttribute("scheduleList", dashBoardService.schedule(model));
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
					cpuObj.put("data",CpuPerc.format(cpu.getIdle()));
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
	public String hyopage(Map<String, Object> paramMap, ModelMap map) throws Exception {
		map.addAttribute("list", dashBoardService.selectBoardList(paramMap));
		return VIEW_PATH + "hyopage";
	}
	
	//그리드용 리스트
	@RequestMapping(value = "/selectBoardList", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public Object selectBoardList(Map<String, Object> paramMap, ModelMap map) throws Exception {
		return resultData(dashBoardService.selectBoardList(paramMap),paramMap);
	}
		//그리드 양식 가공
		public Object resultData(List<Map<String, String>> list, Map<String, Object> paramMap)throws JsonProcessingException, SQLException{
			HashMap <String, Object> res = new HashMap<String,Object>();
			HashMap <String, Object> data = new HashMap<String,Object>();
				data.put("contents", list);
				res.put("result", true);
				res.put("data",data);
				
			if(list.size()>0) {
				ObjectMapper jackson = new ObjectMapper();
				String jsonString = jackson.writeValueAsString(res);
				return jsonString;
			}
			return null;
		}
		
		//그리드 체크 로우삭제
		@RequestMapping(value = "/delGrid", method = {RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public HashMap<String, Integer> delGrid(@RequestParam Map<String,String> paramMap) throws Exception {
			String Test = paramMap.get("delParam");
			ObjectMapper mapper = new ObjectMapper();
			try {
				List<Map<String, Object>> data= mapper.readValue(Test,new TypeReference<List<Map<String, Object>>>(){});
					for(int i = 0; i<data.size(); i++) {
						
						System.out.println(data.get(i));
						dashBoardService.delGrid(data.get(i));
					}
					}catch(IOException e) {
						e.printStackTrace();
				}
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("code",1);
			return map;
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
	
	//캘린더
	@RequestMapping(value = "/insertSchedule", method ={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public HashMap<String,Integer> insertSchedule(@RequestParam Map<String,String> paramMap,ModelMap model) throws Exception {
		 //계정던져
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 paramMap.put("int_name", user.getUsername());
		 
		 //리턴
		HashMap <String, Integer> hm = new HashMap<String,Integer>();
		hm.put("result", dashBoardService.insertSchedule(paramMap));
		return hm;
	}
	
	//웹소켓 파트
	//STOMP 란 ?
	/*- 이전 TTMP로 알려진 간단한 (또는 스트리밍) 텍스트 지향 메시지 프로토콜 (STOMP)는,
	메시지 지향 미들웨어 (MOM) 작업을 위해 디자인 된 간단한 텍스트 기반 프로토콜입니다. 
	그것은 STOMP 클라이언트가 프로토콜을 지원하는 모든 메시지 브로커와 이야기 할 수있는 상호 운용 와이어 형식을 제공합니다.
	그것은 다른 언어로 개발 한 클라이언트 소프트웨어에서 통신을 수신 할 수있는 하나의 프로그래밍 언어 나 플랫폼 용으로 개발 된 브로커를 의미,
	따라서 언어 불가 지론이다.*/
 	/*@MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public Greeting greeting(HelloMessage message) throws Exception {
        Thread.sleep(1000); // simulated delay
        return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
    }*/
	
}