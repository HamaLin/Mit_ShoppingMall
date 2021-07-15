package com.itbank.service;

import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class MailService {

	public String getAuthNumber() {
		// 임시 비밀번호 만들기
		String authNumber = "";
		
		StringBuffer buffer = new StringBuffer();
	
		Random random = new Random();
		
		// 숫자, 영어 대소문자로 구성
		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");
	
		// 10자리로 만들기
		for (int i = 0; i < 10; i++) {	
			buffer.append(chars[random.nextInt(chars.length)]);
		}
		authNumber += buffer.toString();
	
		return authNumber;
	}
	
	public String sendMail(String mailAddress, String authNumber, String account) {
		
		// 메일 발송하는 코드
		String host = "smtp.naver.com";		// Simple Mail Transfer Protocol
		int port = 465;
		final String username = account.split("/")[0];
		final String password = account.split("/")[1];
		
		String subject = "[MIT] 임시 비밀번호 입니다.";
		String body = String.format("임시 비밀번호는 [%s] 입니다.\n\n", authNumber);
		
		// 메일을 발송하는 서버에 대한 속성과 인증을 설정하기
		// 속성
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.trust", host);
		
		// 인증
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
			String un = username;
			String pw = password;
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		mailSession.setDebug(true);		// 메일을 발송하는 과정의 디버깅을 콘솔에 출력한다.
		
		// 보내는 메일 내용 구성하기
		Message mimeMessage = new MimeMessage(mailSession);
		
		try {
			// 보내는 사람 주소
			mimeMessage.setFrom(new InternetAddress(username + "@naver.com"));
			
			// 받는 사람 주소
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(mailAddress));
			
			mimeMessage.setSubject(subject);	// 제목
			mimeMessage.setText(body);			// 내용
			
			Transport.send(mimeMessage);		// 메일 발송
			
		} catch(MessagingException e) {
			return "주소가 잘못되었습니다.";
		}
			
		return authNumber;
	}

}














