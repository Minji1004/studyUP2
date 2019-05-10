package com.sp.timer;

import java.util.Map;

public interface TimerServcie {
	public int insertTimer(Map<String, Object> map);
	public int insertETimer(int timerNum, int second);
	public Timer readTimer(int timerNum);
	public Timer readTimer2(String userId);
}
