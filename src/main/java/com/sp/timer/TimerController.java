package com.sp.timer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("timer.timerController")
public class TimerController {
	
	@RequestMapping(value = "/timer/main")
	public String timerMain() {
		return "timer/main";
	}
	
	@RequestMapping(value = "/timer/selectGoalTime")
	public String timerSelect() {
		
		return "timer/select_goal_time";
	}
}
