package project06.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Service
public class SendpassMailService {
	// 메일 모듈 호출..
		@Autowired(required=false)
		private JavaMailSender sender;
		
		public String sendPassMail(String email) throws MessagingException {
			// 1. 멀티미디어형 메일데이터 전송.
			MimeMessage msg = sender.createMimeMessage();
			
			// 2. 제목 설정.
			msg.setSubject("P.M.S 인증번호");

			// 3. 수신자 설정.
			msg.setRecipient(RecipientType.TO, new InternetAddress(email));

			// 4. 내용 설정
			String sendNum = "";
			for(int i=0; i<8; i++) {
				int randomNum = (int)(Math.random()*3);
				if(randomNum == 0) {
					sendNum += (char)((Math.random()*26)+97);
				}else if(randomNum == 1) {
					sendNum += (char)((Math.random()*26)+65);
				}else if(randomNum == 2) {
					sendNum += (int)((Math.random()*10));
				}
			}
			msg.setText("인증번호 : " + sendNum);
			
			// 5. 발송 처리..
			sender.send(msg);
			
			// 6. 인증번호 리턴
			return sendNum;
		}
}
