package com.com.gentelella.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.com.gentelella.service.DashBoardServiceImpl;
import com.com.vo.DashBoardVO;

@Controller
public class DashBoardController {

	@Autowired
	DashBoardServiceImpl dashBoardService;

	// 스프링부트 시작시 logback 사용가능함 base.xml에서 로그레벨 설정할 것
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	// 뷰패스를 지정해서 영역분리 및 편의기능
	private static final String VIEW_PATH = "dashboard/";
	private static final String VIEW_PATH2 = "itemsample/";

	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}

	// VIEW_PATH 서비스제공 페이지
	// 메인페이지
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Model model) {
		return VIEW_PATH + "dashboard";
	}

	// 일정관리페이지
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar(Model model) {
		return VIEW_PATH + "calendar";
	}

	// 누나의뢰용 페이지
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

}
