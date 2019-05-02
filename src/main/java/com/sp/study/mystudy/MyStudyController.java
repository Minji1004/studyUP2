package com.sp.study.mystudy;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("study.myStudyController")
public class MyStudyController {
	
	@RequestMapping(value="/study/mystudy/main")
	public String main(
				@RequestParam int studyNum,
				@RequestParam(defaultValue="0") int left,
				Model model
			) throws Exception{
		
		
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		return ".studyLayout";
	}

}
