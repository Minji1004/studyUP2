package com.sp.teacher;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;

@Controller("teacher.teacherController")
public class TeacherController {

	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping(value ="/teacher/main", method=RequestMethod.GET)
	public String manage(@RequestParam int tnum, HttpSession session, Model model) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		List<Integer> userType = info.getUserType();		
		String mode = "student";	
		
		if(info.getUserNum()==tnum) {
			for(int type: userType)	
				if(type==3) 
					mode = "teacher";
		}		
		
		Teacher teacher = teacherService.readTeacher(tnum);
		teacher.setTel(makePhoneNumber(teacher.getTel()));
	
		//자기소개
		String msg = teacher.getContent();
		if(msg == null) {
			if(mode.equals("teacher")) {
				msg = "자기소개를 등록해주세요.";
				model.addAttribute("introduceMode", "createIntroduce");
			}
			else
				msg = teacher.getNickname()+" 선생님입니다.";
			
			teacher.setContent(msg);
		}
		else
			model.addAttribute("introduceMode", "updateIntroduce");
		
		//경력
		List<Work> work = teacherService.readWork(tnum);
		String workMode = "updateWork";
		if(work.size()==0)
			workMode = "createWork";		
		model.addAttribute("workMode", workMode);
		
		
		//List<Map<String, String>> subject = teacherService.readSubject(info.getUserId());
		
		
/*		if(subject.size()==0 || subject==null)
			teacher.setSubject(null);
		else
			teacher.setSubject(subject);	*/
		
		model.addAttribute("mode", mode);
		model.addAttribute("left", 0);
		model.addAttribute("teacher", teacher);
		model.addAttribute("tnum", tnum);
		
			
		return ".teacherLayout";
	}

	@RequestMapping(value ="/teacher/createIntroduce", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createIntroduce(HttpSession session, @RequestParam String content) throws Exception{
	
		Map<String, Object> model = new HashMap<>();
	
		SessionInfo info = (SessionInfo)session.getAttribute("member");
	
		Teacher teacher = new Teacher();
		teacher.setUserId(info.getUserId());
		
		URLDecoder.decode(content, "utf-8");		
		teacher.setContent(content);
		
		try {
			teacherService.insertIntroduce(teacher);
			model.put("state", "true");
		}catch(Exception e){
			model.put("state", "false");
		}	

		return model;
	}
	
	
	@RequestMapping(value ="/teacher/updateIntroduce", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateIntroduce(HttpSession session, @RequestParam String content) throws Exception{
	
		Map<String, Object> model = new HashMap<>();
	
		SessionInfo info = (SessionInfo)session.getAttribute("member");
	
		Teacher teacher = new Teacher();
		teacher.setUserId(info.getUserId());
		
		URLDecoder.decode(content, "utf-8");	
		teacher.setContent(content);
		try {
			teacherService.updateIntroduce(teacher);
			model.put("state", "true");
		}catch(Exception e){
			model.put("state", "false");
		}	

		return model;
	}
	
	@RequestMapping(value ="/teacher/listWork")
	@ResponseBody
	public Map<String, Object> listWork(@RequestParam int tnum) throws Exception{
		
		Map<String, Object> model = new HashMap<>();
		List<Work> list = teacherService.readWork(tnum);
		
		model.put("list", list);
				
		return model;
	}
	
	@RequestMapping(value ="/teacher/insertWork")
	@ResponseBody
	public Map<String, Object> insertWork(@RequestParam int tnum, @RequestParam String content) throws Exception{
		
		Map<String, Object> model = new HashMap<>();
		
		Work dto = new Work();
		dto.setTnum(tnum);
		content = URLDecoder.decode(content, "utf-8");		
		dto.setContent(content);
		
		try {
			teacherService.insertWork(dto);
			model.put("state", "true");
		}catch(Exception e){
			model.put("state", "false");
		}	
				
		return model;
	}
	
	
	public static String makePhoneNumber(String phoneNumber) {

		   String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";

		   if(!Pattern.matches(regEx, phoneNumber)) return null;	   

		   return phoneNumber.replaceAll(regEx, "$1-$2-$3");  

	   }

}

