package com.sp.admin.black;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("admin.black.reportService")
public class ReportServiceImpl implements ReportService{

	@Override
	public void insertReport(Report dto) throws Exception {
		//신고하기
		
	}

	@Override
	public int dataReportCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Report> listReport(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteReport(String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
