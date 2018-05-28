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
	  
	  @RequestMapping(value="/main")
	  public String main(){
	    return "main";
	  }
	  
	  // 로그인 
	  @RequestMapping("/login")
	  public String login(Model model, String error, String logout, HttpServletRequest request ){
	    if (logout != null){
	      model.addAttribute("logout", "You have been logged out successfully.");
	    }
	    return "login";
	  }
	  
	  // 로그인 실패시
	  @RequestMapping(value="/loginError")
	  public String loginError(Model model, String username ){
	    model.addAttribute("error", "Your username and password is invalid.");
	    model.addAttribute("username",username);
	    return "login";
	  }
	  
	  // 회원가입폼 
	  @RequestMapping(value="/registration",method=RequestMethod.GET)
	  public String registration(Model model){
	    model.addAttribute("userForm", new User());
	    return "registration";
	  }
	  
	  // 회원가입 처리 후 로그인 
	  @RequestMapping(value="/registration",method=RequestMethod.POST)
	  public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, 
	          Model model ,String[] roles ){
	    String password = userForm.getPassword();
	    userService.saveUser(userForm,roles);
	    securityService.autologin(userForm.getUsername(),password);
	    return "redirect:/main";
	  }
	  
	  // admin 사용자 테스트 
	  @RequestMapping("/admin")
	  public String admin(){
	    return "/admin/admin";
	  }
	  
	  // user 사용자 테스트 
	  @RequestMapping("/user")
	  public String user(){
	    return "/user/user";
	  }
	  
	  // 권한없는 페이지를 들어갔을때 
	  @RequestMapping("/403")
	  public String access(){
	    return "/access";
	  }
	}
