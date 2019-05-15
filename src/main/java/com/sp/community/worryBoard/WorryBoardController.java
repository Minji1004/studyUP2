package com.sp.community.worryBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("worryBoard.worryboardController")
public class WorryBoardController {

	@RequestMapping("/community/worryBoard/list")
	public String list(
			Model model) throws Exception {

		return "community/worryBoard/list";
	}
	
	@RequestMapping(value="/community/worryBoard/created", method=RequestMethod.GET) 
	public String createdForm(
			Model model
			) throws Exception{
		
		return "community/worryBoard/created";
	}
	

}