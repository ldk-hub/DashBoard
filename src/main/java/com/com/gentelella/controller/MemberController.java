package com.com.gentelella.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.com.gentelella.service.DashBoardServiceImpl;
import com.com.gentelella.smtp.Email;
import com.com.gentelella.smtp.EmailSender;
import com.com.vo.Member;
import com.com.vo.MemberRole;

@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	DashBoardServiceImpl dashBoardService;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email email;
	
	@PostMapping("")
	public String create(Member member) {
		MemberRole role = new MemberRole();
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		member.setUpw(passwordEncoder.encode(member.getUpw()));
		role.setRoleName("BASIC");
		member.setRoles(Arrays.asList(role));
		memberRepository.save(member);
		return "redirect:/";
	}
	
	//smtp 비밀번호 찾기 메일전송 
	@RequestMapping("/sendPw.do")
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