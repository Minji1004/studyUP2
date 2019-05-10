package com.sp.timer;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("timer.timerServcie")
public class TimerServiceImpl implements TimerServcie{
	@Autowired
	private CommonDAO dao;	
	
	@Override
	public int insertTimer(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.insertData("timer.insertTimer", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertETimer(int timerNum, int second) {
		int result = 0;
		try {
			Timer timerDto = dao.selectOne("timer.readTimer2", timerNum);
			
			int goalNum = timerDto.getGoalNum();
			
			int pureStudyTime = goalNum - second;
			
			Map<String, Object> map = new HashMap<>();
			map.put("timerNum", timerNum);	
			map.put("pureStudyTime", pureStudyTime);
			
			result = dao.updateData("timer.updateETimer", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Timer readTimer(int timerNum) {
		Timer dto = null;
		
		try {
			dto = dao.selectOne("timer.readTimer2",timerNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Timer readTimer2(String userId) {
		Timer dto = null;
		
		try {
			dto = dao.selectOne("timer.readTimer",userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
