package com.sp.study.mystudy.quiz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.study.Study;
import com.sp.study.StudyService;

@Controller("study.quizController")
public class QuizBoardController {
	@Autowired
	private StudyService study;
	
	@RequestMapping(value="/study/quiz/list")
	public String main(
				@RequestParam int studyNum,
				@RequestParam(defaultValue="2") int left,
				Model model
			) throws Exception{
		
		Study dto = study.readStudy(studyNum);
		
		model.addAttribute("dto", dto);		
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		
		return ".study.quiz.list";
	}

}

