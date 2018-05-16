package com.com.gentelella.smtp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class Email {
	@Getter
	@Setter
	private String subject;
    private String content;
    private String receiver;
}
