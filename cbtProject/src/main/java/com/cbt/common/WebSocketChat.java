package com.cbt.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
// 2019.07.18 성재민
// @ServerEndpoint(value = "/echo.do") 는
// /echo.do 라는 url 요청을 통해 웹소켓에 들어가겠다 라는 어노테이션.
@ServerEndpoint(value = "/echo.do")	
public class WebSocketChat {
	private static final List<Session> sessionList = new ArrayList<Session>();
	private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
	
	public WebSocketChat() {
		System.out.println("웹소켓(서버) 객체 생성");
	}
	
	@RequestMapping(value = "/chat.do")
	public String chatViewPage() {
		return "candidate/candidate/chat";
	}
	
	// 2019.07.18 성재민
	// @OnOpen 는 클라이언트가 웹소켓에 들어오고 서버에 아무런 문제 없이 들어 왔을때 실행하는 메소드
	@OnOpen
	public void onOpen(Session session) {
		logger.info("Open session id : " + session.getId());
		
		/*
		 * final Basic basic = session.getBasicRemote(); try {
		 * //basic.sendText("Connection Established"); } catch (IOException e) {
		 * e.printStackTrace(); }
		 */
		
		sessionList.add(session);
	}
	
	// 2019.07.18 성재민
	// 모든 사용자에게 메시지를 전달한다.
	// 어떤 누군가에게 메시지가 왔다면 그 메시지를 보낸 자신을 제외한
	// 연결된 세션(클라이언트)에게 메시지를 보내는 메소드
	private void sendAllSessionToMessage(Session self, String message) {
		try {
			for(Session session : WebSocketChat.sessionList) {
				if(!self.getId().equals(session.getId())) {
					session.getBasicRemote().sendText(message);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 2019.07.18 성재민
	// 클라이언트에서 메시지가 들어왔을 때, 실행되는 메소드
	@OnMessage
	public void onMessage(String message, Session session) {
		logger.info("Message From " + message);
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText(message);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		sendAllSessionToMessage(session, message);
	}
	
	@OnError
	public void onError(Throwable e, Session session) {
		
	}
	
	// 2019.07.18 성재민
	// 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드
	@OnClose
	public void onClose(Session session) {
		logger.info("Session " + session.getId() + " has ended");
		sessionList.remove(session);
	}
}
