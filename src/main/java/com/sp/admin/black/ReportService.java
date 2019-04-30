package com.sp.admin.black;

import java.util.List;
import java.util.Map;

public interface ReportService {
	public void insertReport(Report dto) throws Exception;
	public int dataReportCount(Map<String, Object> map) throws Exception;
	public List<Report> listReport(Map<String, Object> map) throws Exception;
	public Report readReport(int num) throws Exception;
	public int userCount(Map<String, Object> map) throws Exception;	
}
