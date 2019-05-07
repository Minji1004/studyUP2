package com.sp.study.mystudy;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.member.SessionInfo;
import com.sp.study.Study;
import com.sp.study.StudyService;

@Controller("study.myStudyController")
public class MyStudyController {
	@Autowired
	private StudyService service;	
	
	@RequestMapping(value="/study/mystudy/main")
	public String main(
				@RequestParam int studyNum,
				@RequestParam(defaultValue="0") int left,
				Model model,
				HttpSession session) throws Exception{
		
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/member/login";
		}
		
		
		Study dto = service.readStudy(studyNum);
		
		if(dto==null)
			return "redirect:/study/main";
		
		
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		model.addAttribute("dto", dto);
		
		return ".studyLayout";
	}

}
