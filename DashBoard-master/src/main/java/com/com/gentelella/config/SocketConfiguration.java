package com.com.gentelella.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.com.gentelella.socket.SocketHandler;

@Configuration
@EnableWebSocket //클라이언트와 서버간의 양방향 통신을 해주는 역할 - IE 10부터지원
public class SocketConfiguration implements WebSocketConfigurer{

	@Autowired
	SocketHandler socketHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(socketHandler, "/chating");
	}


}
