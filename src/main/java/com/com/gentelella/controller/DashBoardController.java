package com.com.gentelella.controller;

import java.util.List;
import java.util.Map;

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
	private static final String VIEW_PATH = "dashboard/";
	private static final String VIEW_PATH2 = "itemsample/";
	

	// VIEW_PATH 서비스제공 페이지
	// 메인페이지
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Model model) {
	    User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("현재로그인" + user.getUsername());
		return VIEW_PATH + "dashboard";
	}

	// 일정관리페이지
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar(Model model) {
		
		
		return VIEW_PATH + "calendar";
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

	// VIEW_PATH2 개발용 기타 API 샘플 페이지(차트,폼 레이아웃, 아이콘)
	@RequestMapping(value = "/chartjs", method = RequestMethod.GET)
	public String chartjs(Model model) {
		return VIEW_PATH2 + "chartjs";
	}

	@RequestMapping(value = "/chartjs2", method = RequestMethod.GET)
	public String chartjs2(Model model) {
		return VIEW_PATH2 + "chartjs2";
	}

	@RequestMapping(value = "/echarts", method = RequestMethod.GET)
	public String echarts(Model model) {
		return VIEW_PATH2 + "echarts";
	}

	@RequestMapping(value = "/icons", method = RequestMethod.GET)
	public String icons(Model model) {
		return VIEW_PATH2 + "icons";
	}

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model) {
		return VIEW_PATH2 + "form";
	}
	
	//smtp 비밀번호 찾기 메일전송 현재 프로퍼티에 계정정보 누출가능성을 염두하여 테스트만진행 후 디폴트값으로 바꿈
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
