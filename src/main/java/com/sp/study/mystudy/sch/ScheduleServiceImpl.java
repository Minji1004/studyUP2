package com.sp.study.mystudy.sch;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("study.ScheduleService")
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	CommonDAO dao;	

	@Override
	public int insertSchedule(Schedule sch) {
		int result = 0;
		
		try {
			result = dao.insertData("studySch.insertSchedule", sch);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Schedule> listMonthSchedule(Map<String, Object> map) {
		List<Schedule> list = null;
		
		try {
			list = dao.selectList("studySch.listMonthSchedule", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Schedule readSchedule(int num) {
		Schedule sch = null;
		
		try {
			sch = dao.selectOne("studySch.readSchedule", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sch;
	}

	@Override
	public int updateSchedule(Schedule sch) {
		int result = 0 ;
		
		try {
			result = dao.updateData("studySch.updateSchedule", sch);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteSchedule(int num) {
		int result = 0;
		
		try {
			result = dao.deleteData("studySch.deleteSchedule", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
