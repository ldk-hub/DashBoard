package com.com.gentelella;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
public class GentelellaApplication {

	public static void main(String[] args) {
		SpringApplication.run(GentelellaApplication.class, args);
	}
}
/*BCryptPasswordEncoder
스프링 시큐리티에서 기본적을 사용하는 암호화 방식으로 암호화가 될때마다 새로운 값을 생성한다. 임의적인 값을 추가해서 암호화하지 않아도 된다. (salt 사용하지 않는다.)*/
