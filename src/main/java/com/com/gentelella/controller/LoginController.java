package com.com.gentelella.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.com.gentelella.service.SecurityService;
import com.com.gentelella.service.UserService;
import com.com.gentelella.vo.User;

@Controller
public class LoginController {
	  
	 // 카카오톡 OAuth2 정보
	  private final static String K_CLIENT_ID = "나의 앱 키 입력";
      private final static String K_REDIRECT_URI = "리다이렉트 주소입력";
	
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
	  
	  
	  //카카오톡 OAuth2 로그인 영역
	 
	  @RequestMapping("/auth/kakao/callback")
	    public  @ResponseBody String kakaoCallBack(String code) {
		 // 1. 카카오로그인 후 인증코드 리스폰 받음 하지만 로그인이 완료되지 않음
		 // 2. 사용자토큰을 받아야 카카오 로그인을 완료하게됨.
		 //인증코드(GET방식) 토큰발급(POST)
		 //토큰 발급 필수 전달 4가지 항목
		 
		//POST방식으로 key=value 데이터를 요청(카카오쪽으로)
		  
		  
		  
		  //하단의 함수분석은 추후 업데이트예정
		  //RestTemplate spring 3.0 부터 지원
		  RestTemplate rt = new RestTemplate();
		  //HttpHeaders오브젝트생성
		  HttpHeaders headers = new HttpHeaders();
		  headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		  //HttpBody 오브젝트 생성
		  MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
		  
		  params.add("grant_type","authorization_code");
		  params.add("client_id","e0fe198a94267329d51b8335fe81e6ea");// 변수 가공 
		  params.add("redirect_uri","http://localhost:9110/auth/kakao/callback");
		  params.add("code",code);
		  
		  //헤더값을 가진 엔티티가 됨.
		  //HttpHeader와 HttpBody를 하나의 오브젝트로 담기
		  HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest = new HttpEntity<>(params,headers);  
		  
		  //Http요청하기 -> Post방식으로 -> response변수의 응답받음.
		  ResponseEntity<String> response = rt.exchange(
													  "https://kauth.kakao.com/oauth/token",
													  HttpMethod.POST,
													  kakaoTokenRequest,
													  String.class);
		  
	        return "kakao Oauth2 access Token code:"+response;
	    }
	 
	  
	  
	  
	  //Github OAuth2 로그인 영역
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  //네이버 OAuth2 로그인 영역
	  
	  
	  
}
