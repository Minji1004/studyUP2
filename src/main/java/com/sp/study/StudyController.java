package com.sp.study;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.member.SessionInfo;

@Controller("study.studyController")
public class StudyController {
	@Autowired
	private StudyService service;
/*	
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	*/
	
	@RequestMapping(value="/study/main", method=RequestMethod.GET)
	public String method() {
		return ".study.main";
	}
	
	@RequestMapping(value="/study/studyDetail")
	public String studyDetail() {
		return "study/studyDetail";
	}
	
	@RequestMapping(value="/study/makeStudy", method=RequestMethod.GET)
	public String makeStudy(Model model) {
		model.addAttribute("mode", "created");
		
		return "study/makeStudy";
	}
	
	@RequestMapping(value="/study/makeStudy", method=RequestMethod.POST)
	public String makeStudySubmit(
			Study dto,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root +"uploads"+File.separator+"study";
		
		dto.setUserId(info.getUserId());
		dto.setUserName(info.getUserName());
		
		service.insertStudy(dto, pathname);
		
		return "redirect:/study/main";
	}

}
