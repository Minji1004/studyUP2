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
			dao.insertData("admin.insertReport", dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int dataReportCount(Map<String, Object> map) throws Exception {
		int result=0;
		
		try {
			result=dao.selectOne("admin.dataReportCount", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Report> listReport(Map<String, Object> map) throws Exception {
		List<Report> list = null;
		
		try {
			list=dao.selectList("admin.listReport", map);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Report readReport(int num) throws Exception {
		Report rdto = null;
		
		try {
			rdto=dao.selectOne("admin.");
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	

}
