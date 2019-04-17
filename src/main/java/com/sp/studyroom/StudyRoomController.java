package com.sp.studyroom;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("studyroom.StudyRoomController")
public class StudyRoomController {
	
	@RequestMapping(value = "/studyroom/main")
	public String pageMain() {		 
		return ".studyroom.main";
	}
	
	@RequestMapping(value = "/studyroom/modal/main")
	public String modalMain() {		 
		
		return "studyroom/modal/main";
	}
	
	@RequestMapping(value = "/studyroom/modal/created", method=RequestMethod.GET)
	public String modalWriteForm(
			Model model
			) throws Exception {		 
		
		model.addAttribute("mode", "created");
		return "studyroom/modal/write";
	}
}
