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
	
	@RequestMapping(value="/study/studyDetail")
	public String studyDetail() {
		return "study/studyDetail";
	}
	
	@RequestMapping(value="/study/makeStudy")
	public String makeStudy() {
		return "study/makeStudy";
	}

}
