package com.sp.timer;

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
	public int insertETimer(String userId) {
		int result = 0;
		try {
			int timerNum = dao.selectOne("timer.selectRecentTimer", userId);
			result = dao.updateData("timer.updateETimer", timerNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	

}
