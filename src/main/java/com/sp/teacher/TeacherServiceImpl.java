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
	public Teacher readTeacher(String userId) throws Exception{
		Teacher teacher = null;
		
		try {
			teacher = dao.selectOne("teacher.readTeacher",userId);
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
			dao.insertData("teacher.updateIntroduce", dto);
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
		}
	}
	
	




	
	
	

}
