package com.sp.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("member.registerController")
public class RegisterController {
	
	@Autowired
	private RegisterService registerService;
	
	@RequestMapping(value ="/register/check", method=RequestMethod.GET)
	public String check(@RequestParam String mode, HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");		
		
		List<Integer> userType = info.getUserType();
		String tel = info.getTel();
		
		for(int type: userType)	{
			if(type==3&&mode.equals("teacher")) 
				return ".teacherLayout";
			if(type==2&&mode.equals("studyroom"))
				return mode+"/manage"; //재민오빠! 스터디룸 관리자 페이지로 가는 주소 넣어야함.
		}		
		
		List<Bank> list = registerService.selectBank();
		
		model.addAttribute("mode", mode);
		model.addAttribute("tel", tel);
		model.addAttribute("bankList", list);

		return ".member.register";
	}

	@RequestMapping(value ="/register/submit", method=RequestMethod.POST)
	public String check(@RequestParam Map<String, Object> map, HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");	
		map.put("userNum", info.getUserNum());
		String mode = (String)map.get("mode");
		if(mode.equals("teacher"))
			map.put("blicenseKindNum", 2);
		else
			map.put("blicenseKindNum", 1);	
		
		int result = registerService.insertRegister(map);
		
		if(result!=1) {
			model.addAttribute("mode",mode);
			return ".member.register";
		}			
		
		if(mode.equals("teacher"))
			info.getUserType().add(3);
		else
			info.getUserType().add(2);	
		

		if(mode.equals("teacher"))
			return ".teacherLayout";
		else
			return ".teacherLayout"; //재민오빠! 스터디룸 관리자 페이지로 보내야함.
		
		
	}
}