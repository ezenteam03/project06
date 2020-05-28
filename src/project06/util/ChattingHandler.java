package project06.util;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/*
# chatting Handler 구현
1. TextWebSocketHandler를 기본 클래스로 상속
	1) overriding 해야할 메서드 정의
		- 접속시 처리할 내용
		- 채팅시 처리할 내용 
		- 접속후 처리할 내용
		- 예외가 발생싱 처리할 내용..

*/
@Controller("chatHandler")
public class ChattingHandler extends TextWebSocketHandler {
/*
# 메서드에 넘겨오는 주요 매개 객체들.
1. WebSocketSession
	클라이언트가 접속하거나, 메시지를 보낼때, 클라이언트에 대한 
	정보를 가져온다.
2. TextMessage
	클라이언트가 전송한 메시지를 처리한 객체.

# 서버에 등록된 client 정보 
1. Map<String, WebSocketSession>
	put()를 통해서, id와, client Session를 추가/삭제 처리한다.
	
 */
	// client의 접속 정보 저장 
	private Map<String, WebSocketSession> 
		users = new ConcurrentHashMap();
	
	// 1. 접속 완료 후, 처리할 메서드.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.put(session.getId(), session);
		// TODO Auto-generated method stub
		//super.afterConnectionEstablished(session);
		log(session.getId()+"님 접속합니다!!");
		// client 추가 처리.(서버에 접속한 client 정보 누적)
		
	}	
	// 2. 메시지를 보낼 때, 처리할 메서드.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for(WebSocketSession ws : users.values() ) {
			// 1. 각 client에게 메시지 전달.
			ws.sendMessage(message);
			// 2. 전달하는 메시지 log 처리.
			log(ws.getId()+"에게 전달 메시지:"+message.getPayload());
		}
		// TODO Auto-generated method stub
		// 특정한 클라이언트에서 온 메시지를 접속한 모든 client에게 전달.
		log(session.getId()+"에서 온 메시지:"+message.getPayload());
		// 접속 client에 대한 메시지는 
		// WebSocketSession의 sendMessage()로 전달이 가능하다.
		// 각 client의 WebSocketSession의 정보는 users.values()로 
		// 배열 형태로 가지고 있다.
		
		
	}
	// 3. 접속 종료시 처리할 메서드.
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session.getId());
		// TODO Auto-generated method stub
		// super.afterConnectionClosed(session, status);
		// 접속 종료한 client를 서버에서 제외 처리..
		log(session.getId()+" 접속 종료합니다.");
	
		
	}
	// 4. 에러가 발생시 처리할 메서드.
	@Override
	public void handleTransportError(WebSocketSession session, 
					Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		//super.handleTransportError(session, exception);
		// 에러가 발생한 session의 id값과 에러 내용 로그 출력.
		log(session.getId()+" 에러 발생!! 에러 내용:"
				+exception.getMessage());
		
	}
	private void log(String logMsg) {
		System.out.println(new Date()+":"+logMsg);
	}
	
	
	
}
