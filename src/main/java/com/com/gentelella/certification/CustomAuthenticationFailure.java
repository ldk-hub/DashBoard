package com.com.gentelella.certification;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomAuthenticationFailure implements AuthenticationFailureHandler {
    @Override//인증실패시 이쪽경로를타게하여 에러떨어지게함
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {
    	request.setAttribute("username", request.getParameter("username"));
        request.getRequestDispatcher("/loginError").forward(request, response);
    }
}


