package com.com.gentelella;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

	//@SpringBootApplication은 밑의 기능을 자동으로 설정해주는 편리한 기능이다.
/*	1.@Configuration 은 클래스를 애플리케이션 컨텍스트의 Bean 정의 소스로 태그 지정 합니다.
	2.@EnableAutoConfiguration 은 Spring Boot에게 클래스 패스 설정, 다른 bean 및 다양한 속성 설정을 기반으로 bean 추가를 시작 하도록 지시합니다.
			기술적으로, Spring Boot는 스케줄링에 대해서는 자동 설정이 필요하지 않지만 향후 버전에서는 자동으로 구성 할 수 없습니다.
	3.@ComponentScan 은 Spring에게 다른 구성 요소, 구성 및 서비스를 찾도록 지시합니다. */
@SpringBootApplication(scanBasePackages = {"com.com.gentelella.*"})
@EnableJpaRepositories(basePackages ={ "com.com.gentelella.*"})    
@EntityScan(basePackages ={ "com.com.gentelella.*"})
public class GentelellaApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(GentelellaApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(GentelellaApplication.class, args);
	}
}
