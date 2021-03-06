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
		List<Report> rlist = null;
		
		try {
			rlist=dao.selectList("admin.listReport", map);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return rlist;
	}

	@Override
	public Report readReport(int reportNum) throws Exception {
		Report rdto = null;
		
		try {
			rdto=dao.selectOne("admin.readReport", reportNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return rdto;
	}

	@Override
	public int userReportCount(int reportedUser) throws Exception {
		int result=0;
				
		try {
			result=dao.selectOne("admin.userCount", reportedUser);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

}
