package com.sp.admin.report;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("report.reportController")
public class ReportController {
	
	@RequestMapping(value="/admin/report/list")
	public String reportController() {
		
		return ".admin.report.list";
	}
}
