package com.sp.teacher;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("teacher.teacherService")
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private CommonDAO  dao;
	
	@Override
	public Teacher readTeacher(int tnum) throws Exception{
		Teacher teacher = null;
		
		try {
			teacher = dao.selectOne("teacher.readTeacher",tnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return teacher;
	}
	
	@Override
	public List<Map<String, String>> readSubject(String userId) throws Exception{
		List<Map<String, String>> list=null;
		try {
			list=dao.selectList("teacher.listReply", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateIntroduce(Teacher dto) throws Exception{
		try {
			dao.updateData("teacher.updateIntroduce", dto);
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
		}
	}

	@Override
	public void insertIntroduce(Teacher dto) throws Exception {
		try {
			dao.insertData("teacher.insertIntroduce", dto);
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
		}
		
	}
	
	@Override
	public List<Work> readWork(int tnum) throws Exception{
		List<Work> list=null;
		try {
			list=dao.selectList("teacher.readWork", tnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertWork(Work dto) throws Exception {
		
		try {
			dao.insertData("teacher.insertWork", dto);
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
		}		
		
	}

	@Override
	public int readLastWorkNum(int tnum) throws Exception {
		
		int result = 0;
		
		try {
			result = dao.selectOne("teacher.readLastWorkNum", tnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}

	@Override
	public void deleteWork(int num) throws Exception {
		try {
			dao.deleteData("teacher.deleteWork", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public String readSubject(int tnum) throws Exception {
		
		String result = null;
		
		try {
			result = dao.selectOne("teacher.readSubject", tnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertSubject(Map<String, Object> map) throws Exception {
		
		try {
			dao.insertData("teacher.insertSubject", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateSubject(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("teacher.updateSubject", map);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	

}
