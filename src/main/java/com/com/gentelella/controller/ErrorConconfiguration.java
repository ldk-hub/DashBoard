package com.com.gentelella.controller;
//에러상황별 페이지 분기 
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.http.HttpStatus;

public class ErrorConconfiguration extends ServerProperties {
	
	 @Override
	  public void customize(ConfigurableEmbeddedServletContainer container) {
	    super.customize(container);
	    container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/404error"));
	    container.addErrorPages(new ErrorPage(HttpStatus.METHOD_NOT_ALLOWED, "/405error"));
	    container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500error"));
	    container.addErrorPages(new ErrorPage(Exception.class, "/error"));
	  }
}