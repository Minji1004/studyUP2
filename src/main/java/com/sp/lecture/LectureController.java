package com.sp.lecture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("lecture.lectureController")
public class LectureController {

	@RequestMapping(value ="/lecture/main", method=RequestMethod.GET)
	public String main() {		
		
		return ".lecture.main";
	}
	
}
