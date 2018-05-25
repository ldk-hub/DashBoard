package com.com.gentelella.certification;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomAuthenticationFailure implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {
        // 로그인 실패시 username을 화면에 그대로 출력하도록 하기 위해 아래와 같은  
        // 핸들러를 작성하였는데 더 쉬운 방법 아시는분?? 
        request.setAttribute("username", request.getParameter("username"));
        request.getRequestDispatcher("/loginError").forward(request, response);
    }
}


