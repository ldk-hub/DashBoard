package com.com.gentelella.config;

import java.nio.charset.Charset;

import javax.servlet.Filter;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

//스프링 IoC 컨테이너가 해당 클래스를 빈 정의의 소스로 사용한다는 것을 나타낸다.
@Configuration
/*@EnableWebMvc란: web mvc을 이용하는데 있어서 spring container가 가져야할 기본적인 bean component을 등록해서 빠르게 편하게 mvc을 구축할수 있는 configuration 환경을 제공해준다.
	예를 들면 spring3 에서 새롭게 제시하고 있는 @MVC (@RequestMapping, @Requestbody, @ResponseBody)등의 
	스타일을 위해서 등록되어야 하는 RequestMappingHandler,RequestMappingHandlerAdapter,ExceptionHandlerExceptionResolver 등의 등록을 자동으로 해준다.
	XML base였다면 <mvc:annotation-driven/>과 같다. */
@EnableWebMvc
public class WebMvcConfiguration extends WebMvcConfigurerAdapter {
   
	@Bean
    public InternalResourceViewResolver getInternalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setViewClass(JstlView.class);
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");

        return resolver;
    }
	
	//인코딩 문제 코드지만 소용없음 문제찾을것
	@Bean
    public HttpMessageConverter<String> responseBodyConverter() {
        return new StringHttpMessageConverter(Charset.forName("UTF-8"));
    }
	//인코딩 문제 코드지만 소용없음 문제찾을것POST
    @Bean
    public Filter characterEncodingFilter() {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        return characterEncodingFilter;
    }

    @Override
    public void addResourceHandlers( ResourceHandlerRegistry registry )
    {
        registry.addResourceHandler( "/static/**" ).addResourceLocations( "classpath:/static/" );
    }
}
