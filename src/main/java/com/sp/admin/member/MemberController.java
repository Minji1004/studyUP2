package com.sp.admin.member;

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

@Controller("admin.memberController")
public class MemberController {
	
	@Autowired
	private MemberService mservice;
	@Autowired
	private MyUtil util;	
	
	@RequestMapping(value="/admin/member/list")
	public String memberList(
		@RequestParam(value="page",defaultValue="1") int current_page,
		@RequestParam(defaultValue="") String keyword,
		HttpServletRequest req,
		Model model
		) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows=6;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("keyword", keyword);
		
		dataCount= mservice.memberCount(map);		
		
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
		
		List<Member> mlist = mservice.memberList(map);
		
		int mlistNum, n=0;
		for(Member mdto:mlist) {
			mlistNum=dataCount-(start+n);
			mdto.setMlistNum(mlistNum);
			n++;
		}
		
		String query="";
		String listUrl, articleUrl;
		
		if(keyword.length() != 0) {
			query="keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		listUrl=cp+"/admin/member/list";
		articleUrl=cp+"/admin/member/article?page="+current_page;
		
		if(query.length()!=0) {
			listUrl = listUrl+"?"+query;
			articleUrl = articleUrl+"&"+query;
		}
		
		String paging = util.paging(current_page, total_page, listUrl);
		
		model.addAttribute("mlist", mlist);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		
		model.addAttribute("keyword", keyword);
		
		return ".admin.member.list";
	}
	
	@RequestMapping(value="/admin/member/article")
	public String memberArticle(
		@RequestParam(defaultValue="") String keyword,
		@RequestParam String userId,
		@RequestParam String page,
		HttpServletRequest req,
		Model model
		) throws Exception {
		
		String query="page="+page;
		keyword = URLDecoder.decode(keyword, "utf-8");
		if(keyword.length()!=0) {
			query+="&keyword="+URLEncoder.encode(keyword, "utf-8");			
		}
				
		Member mdto = mservice.readMember(userId);
		
		if(mdto==null) {
			return "redirect:/admin/member/list";
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("userId", userId);
		
		model.addAttribute("mdto", mdto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
				
		return ".admin.member.article";
	}
	
	@RequestMapping(value="admin/member/delete")
	public String deleteMember(
		@RequestParam String userId,
		@RequestParam String page,
		@RequestParam(defaultValue="") String keyword,
		Model model
		) throws Exception{
		
		String query = "page="+page;
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		if(keyword.length() != 0) {
			query+="&keyword="+URLEncoder.encode(keyword, "utf-8");			
		}
		
		mservice.deleteMember(userId);
	return "redirect:/admin/member/list";
	}
}
