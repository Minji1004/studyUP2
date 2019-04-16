package com.sp.mail;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("mail.mailController")
public class MailController {
	@Autowired
	private MailSender mailSender;
	@Autowired
	private MailService mailService;
	

	@RequestMapping(value="/mail/send", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendSubmit(@RequestParam String userEmail) throws Exception {
		
		Map<String, Object> model = new HashMap<>();
		String state = "true";	
		String numRan = "";
		for(int i=0; i<6; i++) {
			numRan += (int)(Math.random()*10);
		}
		
		
		Mail dto = new Mail();
		dto.setContent("인증번호는 " + numRan + " 입니다.");
		dto.setReceiverEmail(userEmail);
		dto.setSenderEmail("ehdrjs1346@naver.com");
		dto.setSenderName("(주)스터디업");
		dto.setSubject("(주) 스터디업 회원가입 인증번호 입니다.");
		
		boolean b=mailSender.mailSend(dto);
		
		String msg= dto.getReceiverEmail() + " 님에게 ";
		if(b) {
			int isExist = mailService.isExistSigninMail(userEmail);
			
			if(isExist == 0) {
				//존재 안함. 이메일과 인증키 삽입
				mailService.insertSigninMailNum(userEmail, numRan);
			}else if(isExist == 1) {
				//이메일 이미 존재 .인증키 업데이트 
				mailService.updateSigninMailNum(userEmail, numRan);
			}
			
			
			msg+="메일을 성공적으로 전송 했습니다.";
		} else {
			msg+="메일을 전송하는데 실패했습니다.";
			state = "false";
		}
		
		//입력한 이메일도 전송
		model.put("confirmKey", numRan);
		model.put("message", msg);
		model.put("state", state);
		
		return model;
	}
}
