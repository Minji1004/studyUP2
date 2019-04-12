package com.sp.study;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("studyController")
public class StudyController {
	
	@RequestMapping(value="/study/main", method=RequestMethod.GET)
	public String method() {
		return ".study.main";
	}

}
