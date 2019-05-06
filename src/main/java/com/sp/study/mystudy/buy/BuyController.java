package com.sp.study.mystudy.buy;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("study.buyController")
public class BuyController {
	
	@RequestMapping(value="/study/buy/list")
	public String main(
				@RequestParam int studyNum,
				@RequestParam(defaultValue="8") int left,
				Model model
			) throws Exception{
		
		
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		
		return ".study.buy.list";
	}

}


