package com.sp.studyroom;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("studyroom.StudyRoomController")
public class StudyRoomController {
	
	@RequestMapping(value = "/studyroom/main")
	public String main() {		 
		return ".studyroom.main";
	}
	
}
