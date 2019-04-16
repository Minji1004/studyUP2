package com.sp.admin.black;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("admin.blackController")
public class BlackController {
	
	@Autowired
	private ReportService rservice;
		
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/admin/blacklist/list")
	public String blacklist() {
		return ".admin.blacklist.list";
	}
	
	@RequestMapping(value="/admin/blacklist/report")
	public String reportlist(
		@RequestParam(value="page", defaultValue="1") int current_page,
		@RequestParam(defaultValue="") String keyword,
		HttpServletRequest req,
		Model model
		) throws Exception{
		
		String cp=req.getContextPath();
		
		int rows=6;
		int total_page = 0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("keyword", keyword);
		
		dataCount = rservice.dataReportCount(map);
		
		if(dataCount != 0) {
			total_page=util.pageCount(rows, dataCount);
		}
		
		int start=(current_page-1)*rows;
		if(start<0) {
			start=0;
		}
		map.put("start", start);
		map.put("rows", rows);
		
		List<Report> rlist = rservice.listReport(map);
		
		int rlistNum, n =0;
		for(Report rdto:rlist) {
			rlistNum=dataCount-(start+n);
			rdto.setRlistNum(rlistNum);
			n++;
		}
		
		String query="";
		String listUrl;		
		
		if(keyword.length() != 0) {
			query="keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		listUrl= cp+"/admin/black/list";
		if(query.length() !=0) {
			listUrl = listUrl+"?"+query;
		}
		
		String paging = util.paging(current_page, total_page, listUrl);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		
		model.addAttribute("keyword", keyword);
		
		
		return ".admin.blacklist.list";
	}
}
