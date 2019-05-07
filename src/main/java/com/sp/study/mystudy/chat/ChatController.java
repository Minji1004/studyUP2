package com.sp.study.mystudy.chat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("study.chatController")
public class ChatController {
	@RequestMapping(value="/study/chat/main")
	public String main(
			@RequestParam int studyNum,
			@RequestParam(defaultValue="7") int left,
			Model model) {
		
		
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		
		return ".study.chat.chat";
	}

}
