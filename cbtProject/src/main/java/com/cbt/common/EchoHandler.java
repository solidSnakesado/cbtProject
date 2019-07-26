package com.cbt.common;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

// 2019.07.26 성재민
// 기존 일반 웹소켓을 스프링 웹소켓으로 변경하기 위해 생성
@Controller
public class EchoHandler extends TextWebSocketHandler implements InitializingBean {
	// 2019.07.26 성재민
	// 웹 소켓 세션을 저장할 리스트 생성
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static final Logger LOGGER = LoggerFactory.getLogger(EchoHandler.class);

	public EchoHandler() {
		super();
		EchoHandler.LOGGER.info("create SocketHandler instance!");
	}

	// 2019.07.26 성재민
	// 클라이언트 연결 된 후
	// WebSocketSession을 매개 변수로 받고 클라이언트가 연결된 후
	// 해당 클라이언트의 정보를 가져와 연결확인 작업을한다.
	// 클라이언트의 세션을 세션 저장 리스트에 add()로 추가 한다.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		sessionList.add(session);
		EchoHandler.LOGGER.info("add session!");
	}

	// 2019.07.26 성재민
	// 클라이언트와 연결이 끊어진 경우
	// add()와 반대로 remove()를 이용해서 세션리스트에서 제거한다.
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		sessionList.remove(session);
		EchoHandler.LOGGER.info("remove session!");
	}

	// 2019.07.26 성재민
	// 클라이언트로부터 메시지가 도착했을때 호출
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
		
		for (WebSocketSession webSession : this.sessionList) {
			if (webSession.isOpen()) {
				try {
					webSession.sendMessage(message);
				} catch (Exception ignored) {
					EchoHandler.LOGGER.error("fail to send message!", ignored);
				}
			}
		}
		
		EchoHandler.LOGGER.info("receive message:" + message.toString());
	}

	// 2019.07.26 성재민
	// 전송 에러가 발생할때 호출
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		EchoHandler.LOGGER.error("web socket error!", exception);
	}

	// 2019.07.26 성재민
	// WebSocketHandler가 부분 메시지를 처리할 때 호출
	@Override
	public boolean supportsPartialMessages() {
		EchoHandler.LOGGER.info("call method!");
		return super.supportsPartialMessages();
	}

	public void sendMessage(String message) {
		for (WebSocketSession session : this.sessionList) {
			if (session.isOpen()) {
				try {
					session.sendMessage(new TextMessage(message));
				} catch (Exception ignored) {
					EchoHandler.LOGGER.error("fail to send message!", ignored);
				}
			}
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		/*
		 * Thread thread = new Thread() { int i = 0;
		 * 
		 * @Override public void run() { while (true) { try {
		 * sendMessage("send message index " + i++); Thread.sleep(1000); } catch
		 * (InterruptedException e) { e.printStackTrace(); break; } } } };
		 * 
		 * thread.start();
		 */
	}
	
	
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String chatViewPage() {
		return "empty/common/commonChattingProcess";
	}
	
	// 2019.07.20 성재민
	// 방번호 전달 받아서 해당 방에서 대화 할수 있는 채팅 연결
	@RequestMapping(value = "/chatRoomId.do/{roomId}", method = RequestMethod.GET)
	public String chatView(@PathVariable("roomId") String roomId, Model model) {
		model.addAttribute("roomId", roomId);
		return "empty/common/commonChattingProcess";
	}
}
