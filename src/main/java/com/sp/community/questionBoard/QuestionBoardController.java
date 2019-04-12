package com.sp.community.questionBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("queboard.QueController")
public class QuestionBoardController {
	
	@RequestMapping("/community/questionBoard/list")
	public String list() throws Exception {
		// AJAX-Text
		return "community/questionBoard/list";
	}
}
