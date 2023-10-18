package com.ddit.proj.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class ChatHandler extends TextWebSocketHandler {

	//전체 세션
	private static List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	//개인
//	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	

	//클라이언트가 서버에 접속 성공시 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session); //리스트에 접속한 session들을 담음
		
	}

	
	//소켓에 메세지를 보냈을 때 호출
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.debug("받은메세징{}",message.getPayload());
		
		for (WebSocketSession webSocketSession : sessions) {
			if(webSocketSession != session) {
				webSocketSession.sendMessage(message);				
			}
		}
		
	}

	//연결이 종료됐을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//전체 세션리스트에서 세션 삭제 
		sessions.remove(session);
		
	}
}