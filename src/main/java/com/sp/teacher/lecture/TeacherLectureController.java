package com.sp.teacher.lecture;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.member.SessionInfo;
import com.sp.study.Category;
import com.sp.study.CategoryService;
import com.sp.teacher.Teacher;
import com.sp.teacher.TeacherService;

@Controller("teacher.lecture.teacherLectureController")
public class TeacherLectureController {

	@Autowired
	TeacherService teacherService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	LectureService lectureService;
	
	
	@RequestMapping(value ="/teacher/lecture/teacherLecture", method=RequestMethod.GET)
	public String teacherLecture(@RequestParam int tnum, @RequestParam int left, Model model) throws Exception{		
		
		
		Teacher teacher = teacherService.readTeacher(tnum);
		
		List<Lecture> list = lectureService.readLectureList(teacher);
		
		model.addAttribute("list", list);
		model.addAttribute("teacher", teacher);
		model.addAttribute("tnum", tnum);
		model.addAttribute("left", left);
		
		return ".teacher.main.lectureList";
	}
	
	@RequestMapping(value="/teacher/lecture/makeLecture", method=RequestMethod.GET)
	public String makeLecture(Model model) {
		model.addAttribute("mode", "makeStudy");
		
		// 카테고리 가져오기
		List<Category> list = categoryService.listCategory();
		model.addAttribute("categorylist", list);
		System.out.println(list);
		
		return "teacher/main/makeLecture";
	}

	@RequestMapping(value="/teacher/lecture/makeLecture", method=RequestMethod.POST)
	public String makeLectureSubmit(Lecture dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int num = info.getUserNum();

		String root = session.getServletContext().getRealPath("/");
		String pathname = root +"uploads"+File.separator+"lecture";
		
		dto.setUserId(info.getUserId());
		dto.setUserName(info.getUserName());
		
		lectureService.insertLecture(dto, pathname);
		
		return "redirect:/teacher/lecture/teacherLecture?tnum="+num+"&left=5";
	}
}
