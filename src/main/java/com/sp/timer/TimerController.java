package com.sp.timer;

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
import com.sp.study.Study;

@Controller("timer.timerController")
public class TimerController {
	@Autowired
	private TimerServcie timerService;
	
	@RequestMapping(value = "/timer/main")
	public String timerMain() {
		return "timer/main";
	}
	
	@RequestMapping(value = "/timer/selectGoalTime")
	public String timerSelect(HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		List<Study> categoryStudy = timerService.readCategory(info.getUserId());
		model.addAttribute("categoryStudy",categoryStudy);
		
		
		return "timer/select_goal_time";
	}
	
	@RequestMapping(value = "/timer/start", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertStartTime(
			@RequestParam int second,
			@RequestParam String studyCategory,
			@RequestParam String content,
			@RequestParam String subject,
			HttpSession session){
		Map<String, Object> model = new HashMap<>();
		Map<String, Object> map = new HashMap<>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String userId = info.getUserId();
		map.put("userId", userId);
		map.put("goalNum", second);
		map.put("studyCategory", studyCategory);
		map.put("content", content);
		map.put("subject", subject);
		
		timerService.insertTimer(map);
		Timer timerDto = timerService.readTimer2(userId);
		info.setTimerCheck(timerDto.getTimerNum());
		model.put("state", "true");

		return model;
	}
	@RequestMapping(value = "layout/timer/start", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> startTime(
			@RequestParam int second,
			@RequestParam(defaultValue = "0") int timerCheck,
			HttpSession session){
		Map<String, Object> model = new HashMap<>();

		SessionInfo info = (SessionInfo)session.getAttribute("member");

		Timer timerDto = timerService.readTimer(timerCheck);

		model.put("state", "true");

		return model;
	}
	
	@RequestMapping(value = "/timer/etime", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateEndTime(
			HttpSession session
			,@RequestParam int second
			){
		
		Map<String, Object> model = new HashMap<>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Timer timerDto = timerService.readTimer2(info.getUserId());
		
		int timerCheck = timerDto.getTimerNum();
		
		int result = timerService.insertETimer(timerCheck, second);

		if(result == 0) {
			model.put("state", "false");
		}else {
			model.put("state", "true");
			info.setTimerCheck(0);
		}

		return model;
	}
	
	@RequestMapping(value = "/timer/timer_main", method = RequestMethod.GET)
	public String timer_Main() {
		
		return "timer/timer_main";
	}
	
	@RequestMapping(value = "/timer/getSecond", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getSecond() throws Exception{
		
		Map<String, Object> model = new HashMap<>();
		
		
		return model;
	}
	
	@RequestMapping(value = "/timer/setSecond", method = RequestMethod.POST)
	public void setSecond(@RequestParam int second, HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		info.setTimerSecond(second);
	}
}
