package com.sp.admin.black;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("admin.black.reportService")
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertReport(Report dto) throws Exception {
		//신고하기
		try {
			dao.insertData("black.insertReport", dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int dataReportCount(Map<String, Object> map) throws Exception {
		int result=0;
		
		try {
			result=dao.selectOne("black.dataReportCount", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Report> listReport(Map<String, Object> map) throws Exception {
		List<Report> list = null;
		
		try {
			list=dao.selectList("black.listReport", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteReport(String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
