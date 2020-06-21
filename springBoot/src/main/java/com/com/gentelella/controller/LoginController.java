package com.com.gentelella.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.com.gentelella.service.SecurityService;
import com.com.gentelella.service.UserService;
import com.com.gentelella.vo.User;

@Controller
public class LoginController {
	
	  @Autowired
	  UserService userService;
	  
	  @Autowired
	  private SecurityService securityService;
	  
	  
	  // 로그인 
	  @RequestMapping("/login")
	  public String login(Model model, String error, String logout, HttpServletRequest request ){
		  
	    if (logout != null){
	      model.addAttribute("logout", "성공적으로 로그 아웃되었습니다.");
	    }
	    return "login";
	  }
	  
	  // 로그인 실패시
	  @RequestMapping(value="/loginError")
	  public String loginError(Model model, String username ){
	    model.addAttribute("error", "사용자 이름과 비밀번호가 잘못되었습니다.");
	    model.addAttribute("username",username);
	    return "login";
	  }
	  
	  // 회원가입 처리 후 로그인 
	  @RequestMapping(value="/registration",method=RequestMethod.POST)
	  public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, 
	          Model model ,String[] roles ){
	    String password = userForm.getPassword();
	    userService.saveUser(userForm,roles);//회원가입 로직
	    securityService.autologin(userForm.getUsername(),password);//회원가입 후 바로 로그인처리할수있도록
	    return "redirect:dashboard";
	  }
	  
	  // 권한없는 페이지를 들어갔을때 
	  @RequestMapping("/403")
	  public String access(){
	    return "403error";
	  }
	}
