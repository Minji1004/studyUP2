package com.sp.study.mystudy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("study.myStudyController")
public class MyStudyController {
	
	@RequestMapping(value="/study/mystudy/main")
	public String main() {
		return ".studyLayout";
	}

}
