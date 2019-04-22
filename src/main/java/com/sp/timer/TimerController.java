package com.sp.timer;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;

@Controller("timer.timerController")
public class TimerController {
	@Autowired
	private TimerServcie timerService;
	
	@RequestMapping(value = "/timer/main")
	public String timerMain() {
		
		return "timer/main";
	}
	
	@RequestMapping(value = "/timer/selectGoalTime")
	public String timerSelect() {
		
		return "timer/select_goal_time";
	}
	
	@RequestMapping(value = "/timer/start", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertStartTime(
			@RequestParam int second,
			HttpSession session){
		Map<String, Object> model = new HashMap<>();
		Map<String, Object> map = new HashMap<>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		map.put("userId", info.getUserId());
		map.put("goalNum", second);
		
		int result = timerService.insertTimer(map);
		
		if(result == 0) {
			model.put("state", "false");
		}else {
			model.put("state", "true");
		}

		return model;
	}
	
	@RequestMapping(value = "/timer/etime", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateEndTime(HttpSession session){
		
		Map<String, Object> model = new HashMap<>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
	
		int result = timerService.insertETimer(info.getUserId());
		
		if(result == 0) {
			model.put("state", "false");
		}else {
			model.put("state", "true");
		}

		return model;
	}
}
