package com.sp.study.mystudy.buy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.study.Study;
import com.sp.study.StudyService;

@Controller("study.buyController")
public class BuyController {
	@Autowired
	private StudyService service;
	
	@RequestMapping(value="/study/buy/list")
	public String main(
				@RequestParam int studyNum,
				@RequestParam(defaultValue="8") int left,
				Model model
			) throws Exception{
		
		Study dto = service.readStudy(studyNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		
		return ".study.buy.list";
	}

}


