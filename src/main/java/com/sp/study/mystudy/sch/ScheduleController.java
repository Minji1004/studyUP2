package com.sp.study.mystudy.sch;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import com.sp.study.Study;
import com.sp.study.StudyService;

@Controller("study.scheduleController")
public class ScheduleController {
	@Autowired 
	private ScheduleService service;
	
	@Autowired
	private StudyService study;
	
	@RequestMapping(value="/study/sch/sch")
	public String sch(
			@RequestParam int studyNum,
			@RequestParam int left,
			Model model) throws Exception {
		
		Study dto = study.readStudy(studyNum);
		
		model.addAttribute("dto", dto);
		
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		
		return ".study.sch.sch";
	}
	
	// 모달에 출력할 일정 추가 폼
	@RequestMapping(value="/study/sch/inputForm")
	public String inputForm() throws Exception {
		return "study/sch/inputForm";
	}
	
	// 모달에 출력할 상세 일정 폼
	@RequestMapping(value="/study/sch/articleForm")
	public String articleForm() throws Exception {
		return "study/sch/articleForm";
	} 
	
	@RequestMapping(value="/study/sch/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> created(
			Schedule sch, 
			HttpSession session, 
			@RequestParam int studyNum) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		sch.setUserId(info.getUserId());
		sch.setStudyNum(studyNum);
		service.insertSchedule(sch);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;		
		
	}
	
	@RequestMapping(value="/study/sch/month")
	@ResponseBody
	public Map<String, Object> month(
			@RequestParam String start,
			@RequestParam String end,
			@RequestParam(defaultValue="all") String group,
			@RequestParam int studyNum,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<>();
		map.put("group", group);
		map.put("start", start);
		map.put("end", end);
		map.put("studyNum", studyNum);
		map.put("userId", info.getUserId());
		
		List<Schedule> list = service.listMonthSchedule(map);
		
		List<ScheduleJSON> listJSON = new ArrayList<>();
		Iterator<Schedule> it = list.iterator();
		while (it.hasNext()) {
			Schedule sch = it.next();
			
			ScheduleJSON dto = new ScheduleJSON();
			dto.setId(sch.getNum());
			dto.setStudyNum(sch.getStudyNum());
			dto.setTitle(sch.getTitle());
			dto.setUserName(sch.getUserName());
			dto.setColor(sch.getColor());
			
			if(sch.getAllDay().equals("true"))
				dto.setAllDay(true);
			else
				dto.setAllDay(false);
			
			// 시작 설정
			if(sch.getStartTime()!=null && sch.getStartTime().length()!=0)
				dto.setStart(sch.getStartDay()+ " " +sch.getStartTime());
			else
				dto.setStart(sch.getStartDay());
			
			// 끝 설정
			if(sch.getEndTime()!=null && sch.getEndTime().length()!=0)
				dto.setEnd(sch.getEndDay()+ " " +sch.getEndTime());
			else
				dto.setEnd(sch.getEndDay());
			
			dto.setContent(sch.getContent());
			dto.setCreated(sch.getCraeted());
			
			listJSON.add(dto);			
		}
		
		
		// 작업 결과 JSON으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("list", listJSON);
		return model;
	}
	
	
	@RequestMapping(value="/study/sch/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int num) throws Exception {
		
		String state = "false";
		int result = service.deleteSchedule(num);
		
		if(result==1)
			state="true";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
		
	}
	
	@RequestMapping(value="/study/sch/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(
			Schedule sch,
			HttpSession session) throws Exception{
		String state = "false";
		
		int result = service.updateSchedule(sch);
		if(result==1)
			state="true";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;		
	}

}
