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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("admin.blackController")
public class BlackController {
	
	@Autowired
	private ReportService rservice;
	
	@Autowired
	private BlackService bservice;
		
	@Autowired
	private MyUtil util;

	@RequestMapping(value="/admin/blacklist/list")
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
		
		
		total_page=util.pageCount(rows, dataCount);
		
		if(total_page<current_page) {
			current_page=total_page;
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
		String listUrl, articleUrl;		
		
		if(keyword.length() != 0) {
			query="keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		listUrl= cp+"/admin/blacklist/list";
		articleUrl = cp+"/admin/blacklist/article?page="+current_page;
		
		if(query.length() !=0) {
			listUrl = listUrl+"?"+query;
			articleUrl = articleUrl+"&"+query;
		}
		
		String paging = util.paging(current_page, total_page, listUrl);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);		
		
		model.addAttribute("keyword", keyword);		
		
		return ".admin.blacklist.list";
	}
	
	@RequestMapping(value="/admin/blacklist/article")
	public String reportArticle(
		@RequestParam(defaultValue="") String keyword,
		@RequestParam int reportNum,
		@RequestParam String page,
		HttpServletRequest req,
		Model model
		) throws Exception {
		
		String query="page="+page;
		keyword=URLDecoder.decode(keyword, "utf-8");
		if(keyword.length()!=0) {
			query+="&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		Report rdto=rservice.readReport(reportNum);
		if(rdto==null) {
			return "redirect:/admin/blacklist/list";
		}	
		
		int userNum=rdto.getReportedUser();
		int userCount=rservice.userReportCount(userNum);
		
		rdto.setReportCause(rdto.getReportCause().replaceAll("\n", "<br>"));
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("keyword", keyword);
		map.put("reportNum", reportNum);
		
		
		model.addAttribute("rdto",rdto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("userCount", userCount);
		
						
		return "admin/blacklist/article";
	}
	
	@RequestMapping(value="/admin/blacklist/insert", method=RequestMethod.GET)
	public String insertForm(Model model) {
		model.addAttribute("mode", "insert");
		
		return "admin/blacklist/insert";
	}
	
	@RequestMapping(value="/admin/blacklist/insert", method=RequestMethod.POST)
	public String insertReport(Report rdto, HttpServletRequest req) throws Exception {
		rservice.insertReport(rdto);
		return "redirect:/main";	//리스트 띄우는 법 알아보기		
	}
	
	@RequestMapping(value="/admin/blacklist/listblack")
	public String listBlack(
		@RequestParam(value="page", defaultValue="1") int page,
		@RequestParam(value="") String keyword,
		HttpServletRequest req,
		Model model
		) throws Exception {
		
		String cp = req.getContextPath();
		
		int row=6;
		int total=0;
		int blackCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		
		blackCount=bservice.dataBlackCount(map);
		
		total=util.pageCount(row, blackCount);
		
		if(total<page) {
			page=total;
		}
		
		int first = (page-1)*row;
		if(first<0) {
			first=0;
		}
		
		map.put("first", first);
		map.put("row", row);
		
		List<Black> blist = bservice.listBlack(map);
		
		int blistNum, n=0;
		for(Black bdto:blist) {
			blistNum=blackCount-(first+n);
			bdto.setBlistNum(blistNum);
			n++;
		}
		
		String bquery="";
		String urlList;
		
		if(keyword.length()!=0) {
			bquery="keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		urlList = cp+"/admin/blacklist/list";
		
		if(bquery.length()!=0) {
			urlList=urlList+"?"+bquery;
		}
		
		String phase=util.paging(page, total);
		
		model.addAttribute("blist", blist);
		model.addAttribute("urlList", urlList);
		model.addAttribute("phase", phase);
		model.addAttribute("total", total);
		model.addAttribute("page", page);
		
		model.addAttribute("keyword", keyword);
		
		return "admin.blacklist.list"; 
	}
	
}
