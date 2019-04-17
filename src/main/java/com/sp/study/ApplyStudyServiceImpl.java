package com.sp.study;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("study.applyStudyService")
public class ApplyStudyServiceImpl implements ApplyStudyService{
	@Autowired
	private CommonDAO dao;	
	
	// study 가입신청
	@Override
	public int applyStudy(ApplyStudy dto) {
		int result=0;
		
		try {
			result=dao.insertData("study.applyStudy", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ApplyStudy> listApplyStudy(Map<String, Object> map) {
		List<ApplyStudy> list = null;
		
		try {
			list=dao.selectList("study.listApplyStudy", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public ApplyStudy readApplyStudy(int applyNum) {
		ApplyStudy dto = null;
		
		try {
			dto = dao.selectOne("study.readApplyStudy", applyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int applyStudyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result= dao.selectOne("study.applyStudyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int updateApplyStudy(ApplyStudy dto) {
		int result = 0;
		
		try {
			result = dao.updateData("study.updateApplyStudy", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


}
