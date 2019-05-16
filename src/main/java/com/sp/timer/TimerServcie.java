package com.sp.timer;

import java.util.List;
import java.util.Map;

import com.sp.study.Study;

public interface TimerServcie {
	public int insertTimer(Map<String, Object> map);
	public int insertETimer(int timerNum, int second);
	public Timer readTimer(int timerNum);
	public Timer readTimer2(String userId);
	public List<Study> readCategory(String userId);
}
