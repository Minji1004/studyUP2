package com.sp.study;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;

@Controller("study.studyController")
public class StudyController {
	@Autowired
	private StudyService service;	
	@Autowired
	private CategoryService categoryService;	
	@Autowired
	private ApplyStudyService applyService;

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
		model.addAttribute("mode", "makeStudy");
		
		// 카테고리 가져오기
		List<Category> list = categoryService.listCategory();
		model.addAttribute("categorylist", list);
		System.out.println(list);
		
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
		
	// 과목 가져오기
	@RequestMapping(value="/study/course")
	@ResponseBody
	public Map<String, Object> courseList(
			@RequestParam int categoryNum
			) throws Exception {
		List<Category> listCourse = categoryService.listCourse(categoryNum);
		
		Map<String, Object> model = new HashMap<>();
		model.put("listCourse", listCourse);
		
		return model;		
	} 
	
	// 가입신청 - apply for study	
	@RequestMapping(value="/study/applyStudy", method=RequestMethod.GET)
	public String applyStudy() {
		return "study/applyStudy";
	}
	
	@RequestMapping(value="/study/applyStudy", method=RequestMethod.POST)
	public String applyStudySubmit(
			@RequestParam int studyNum,
			ApplyStudy dto,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		dto.setStudyNum(studyNum);
		dto.setUserId(info.getUserId());
		applyService.applyStudy(dto);
		
		return "redirect:/study/main";
	}

}
