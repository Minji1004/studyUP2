package com.sp.timer;

import java.util.Map;

public interface TimerServcie {
	public int insertTimer(Map<String, Object> map);
	public int insertETimer(String userId);
}
