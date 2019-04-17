package com.sp.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.MyUtil;

@Service("mail.myMailSender")
public class MailSender {
	//@Autowired
	//private FileManager fileManager;
	@Autowired
	private MyUtil myUtil;
	
	private String mailType; // 메일 타입
	private String encType;
	//private String pathname;
	
	public MailSender() {
		this.encType = "utf-8";
		// this.encType = "euc-kr";
		this.mailType = "text/html; charset=utf-8";
		// this.mailType = "text/html; charset=euc-kr";
		// this.mailType = "text/plain; charset=utf-8";
	}

	public void setMailType(String mailType, String encType) {
		this.mailType = mailType;
		this.encType = encType;
	}
	
	// 네이버를 이용하여 메일을 보내는 경우 보내는사람의 이메일이 아래 계정(SMTP 권한 계정)과 다르면 메일 전송이 안된다. 
	// gmail은 기본적으로 <a href ...> 태그가 있으면 href를 제거한다.
	// SMTP 권한
	private class SMTPAuthenticator extends javax.mail.Authenticator {
		  @Override
	      public PasswordAuthentication getPasswordAuthentication() {  
         // 지메일은 경고메시지 전송 - 전송받은 메일에서 보안 수준을 낮추는 링크를 클릭하고 수준을 낮추면 메일 전송가능
         // gmail : 내계정 - 로그인 및 보안 => 아래부분 보안수준이 낮은 앱 사용  허용으로 변경
         // 네이버 : 메일 아래부분 환경설정 클릭후 POP3등을 허용
	    	  
	          String username =  "ehdrjs1346@naver.com"; // 네이버 사용자;
	          // String username =  "지메일아이디"; // gmail 사용자;  
	          String password = "gy2127gy"; // 패스워드;  
	          return new PasswordAuthentication(username, password);  
	       }  
	}
	
	// 첨부 파일이 있는 경우 MIME을 MultiMime로 파일을 전송 한다.
	private void makeMessage(Message msg, Mail dto) throws MessagingException {
			msg.setText(dto.getContent());
			msg.setHeader("Content-Type", mailType);
	} 
		
	
	public boolean mailSend(Mail dto) {
		boolean b=false;
		
		Properties p = new Properties();   
  
		// SMTP 서버의 계정 설정   
		// Naver와 연결할 경우 네이버 아이디
		// Gmail과 연결할 경우 Gmail 아이디
		p.put("mail.smtp.user", "ehdrjs1346" );   
  
		// SMTP 서버 정보 설정   
		p.put("mail.smtp.host", "smtp.naver.com"); // 네이버   
		// p.put("mail.smtp.host", "smtp.gmail.com"); // gmail
		       
		// 네이버와 지메일 동일   
		p.put("mail.smtp.port", "465");   
		p.put("mail.smtp.starttls.enable", "true");   
		p.put("mail.smtp.auth", "true");   
		// p.put("mail.smtp.debug", "true");   
		p.put("mail.smtp.socketFactory.port", "465");   
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
		p.put("mail.smtp.socketFactory.fallback", "false");  
		
		try {
			Authenticator auth = new SMTPAuthenticator();  
			Session session = Session.getDefaultInstance(p, auth);
			// 메일 전송시 상세 정보 콘솔에 출력 여부
			session.setDebug(true);
			
			Message msg = new MimeMessage(session);

			// 보내는 사람
			if(dto.getSenderName() == null || dto.getSenderName().equals(""))
				msg.setFrom(new InternetAddress(dto.getSenderEmail()));
			else
				msg.setFrom(new InternetAddress(dto.getSenderEmail(), dto.getSenderName(), encType));
			
			// 받는 사람
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(dto.getReceiverEmail()));
			
			// 제목
			msg.setSubject(dto.getSubject());
			
			// HTML 형식인 경우 \r\n을  <br>로 변환
			if(mailType.indexOf("text/html") != -1) {
				dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			}
			makeMessage(msg, dto);
			msg.setHeader("X-Mailer", dto.getSenderName());
			
			// 메일 보낸 날짜
			msg.setSentDate(new Date());
			
			// 메일 전송
			Transport.send(msg);

			b=true;
						
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return b;
	}
	

}
