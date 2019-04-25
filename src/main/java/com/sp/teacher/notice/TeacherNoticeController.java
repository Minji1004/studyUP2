package com.sp.teacher.notice;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.member.SessionInfo;
import com.sp.teacher.Teacher;
import com.sp.teacher.TeacherService;

@Controller("teacher.teacher.teacherNoticeController")
public class TeacherNoticeController {
	
	@Autowired
	TeacherService teacherService;
	
	@Autowired
	TeacherNoticeService teacherNoticeService;
	
	@RequestMapping(value ="/teacher/notice", method=RequestMethod.GET)
	public String teacherLecture(@RequestParam int tnum, @RequestParam int left, Model model) throws Exception{		
		
		Teacher teacher = teacherService.readTeacher(tnum);
				
		model.addAttribute("teacher", teacher);
		model.addAttribute("tnum", tnum);
		model.addAttribute("left", left);
		
		return ".teacher.notice.notice";
	}
	
	@RequestMapping(value ="/teacher/notice/created", method=RequestMethod.GET)
	public String createNotice(@RequestParam int tnum, @RequestParam int left, Model model) throws Exception{		
		
		Teacher teacher = teacherService.readTeacher(tnum);
		
		model.addAttribute("teacher", teacher);
		model.addAttribute("tnum", tnum);
		model.addAttribute("left", left);
		
		return ".teacher.notice.created";
	}
	
	@RequestMapping(value ="/teacher/notice/created", method=RequestMethod.POST)
	public String createNotice(TeacherNotice dto, HttpSession session) throws Exception{		
		
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"tnotice";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.settId(info.getUserId());		
		int tnum = info.getUserNum();
		
		try {
			
			teacherNoticeService.insertNotice(dto, pathname);			
			
		}catch(Exception e) {
			e.printStackTrace();
			}
		
		return "redirect:/teacher/notice?tnum="+tnum+"&left=2";
	}

}
