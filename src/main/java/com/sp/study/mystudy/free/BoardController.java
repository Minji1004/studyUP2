package com.sp.study.mystudy.free;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("study.boardController")
public class BoardController {
	
	@RequestMapping(value="/study/free/list")
	public String main(
				@RequestParam int studyNum,
				@RequestParam(defaultValue="2") int left,
				Model model
			) throws Exception{
		
		
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		
		return ".study.free.list";
	}

}
