package com.sp.study.mystudy.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.study.Study;
import com.sp.study.StudyService;

@Controller("study.chatController")
public class ChatController {
	@Autowired
	private StudyService service;
		
	
	@RequestMapping(value="/study/chat/main")
	public String main(
			@RequestParam int studyNum,
			@RequestParam(defaultValue="7") int left,
			Model model) {
		
		List<Study> list = service.studyMember(studyNum);
		
		
		model.addAttribute("list", list);
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		
		return ".study.chat.chat";
	}

}
