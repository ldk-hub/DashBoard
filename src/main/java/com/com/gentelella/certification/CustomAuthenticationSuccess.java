package com.com.gentelella.certification;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomAuthenticationSuccess implements AuthenticationSuccessHandler{
	  private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();;
	  
	  @Override//인증이 성공했을경우 이쪽경로를타고 지정한 url로 이동할수있도록 설정함
	  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
	      Authentication authentication) throws IOException, ServletException {
	      redirectStrategy.sendRedirect(request, response, "/dashboard");
	  }
	  
	  
	}


