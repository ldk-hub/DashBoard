package com.com.gentelella.smtp;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
public class Email {
	@Getter
	@Setter
	private String subject;
    private String content;
    private String receiver;
}
