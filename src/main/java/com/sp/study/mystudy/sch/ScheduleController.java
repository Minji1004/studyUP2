package com.sp.study.mystudy.sch;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("study.scheduleController")
public class ScheduleController {
	
	@RequestMapping(value="/study/sch/sch")
	public String sch(
			@RequestParam int studyNum,
			@RequestParam int left,
			Model model) throws Exception {
		
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		
		return ".study.sch.sch";
	}

}
