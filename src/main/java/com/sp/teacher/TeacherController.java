package com.sp.teacher;

import java.util.HashMap;
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
	public String manage(@RequestParam String mode, HttpSession session, Model model) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info==null)
			return "redirect:/study/main";
		
		Teacher teacher = teacherService.readTeacher(info.getUserId());
		teacher.setTel(makePhoneNumber(info.getTel()));
		
		String msg = teacher.getContent();
		if(msg == null) {
			if(mode.equals("teacher")) {
				msg = "자기소개를 등록해주세요.";
				model.addAttribute("introduceMode", "register");
			}
			else
				msg = teacher.getNickname()+" 선생님입니다.";
			
			teacher.setContent(msg);
		}
		else
			model.addAttribute("introduceMode", "update");
		
		//List<Map<String, String>> subject = teacherService.readSubject(info.getUserId());
		
		
/*		if(subject.size()==0 || subject==null)
			teacher.setSubject(null);
		else
			teacher.setSubject(subject);	*/
				
		model.addAttribute("mode", mode);
		model.addAttribute("left", 0);
		model.addAttribute("teacher", teacher);
			
		return ".teacherLayout";
	}

	
	@RequestMapping(value ="/teacher/updateIntroduce", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateIntroduce(HttpSession session, @RequestParam String content) throws Exception{
	
		Map<String, Object> model = new HashMap<>();
	
		SessionInfo info = (SessionInfo)session.getAttribute("member");
	
		Teacher teacher = new Teacher();
		teacher.setUserId(info.getUserId());
		teacher.setContent(content);
		try {
			teacherService.updateIntroduce(teacher);
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

