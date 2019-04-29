package com.sp.customer.inquiry;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

// inquiry : 1:1 게시판
@Controller("customer.inquiryController")
public class InquiryController {
	@Autowired
	private InquiryService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value= {"/customer/inquiry/list"})
	public String list(			
		@RequestParam(value="page", defaultValue="1") int current_page,
		@RequestParam(defaultValue="all") String condition,
		@RequestParam(defaultValue="") String keyword,
		HttpServletRequest req,
		Model model) throws Exception {
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount=service.dataCount(map);
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		if(total_page<current_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows;
		if(start<0) start=0;
		
		map.put("start", start);
		map.put("rows", rows);
		
		List<Inquiry> list=service.listInquiry(map);
		/*			
		Date endDate=new Date();
		long gap;
		int listNum, n=0;
	
		for(Inquiry dto:list) {
			listNum=dataCount-(start+n);
			dto.setListNum(listNum);
			
			SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate=formatter.parse(dto.getCreated());
			gap=(endDate.getTime()-beginDate.getTime()/(60*60*1000));
			dto.setGap(gap);
			
			dto.setCreated(dto.getCreated().substring(0, 10));
			
			n++;
		}
	*/	
		String cp=req.getContextPath();
		String query="";
		String listUrl=cp+"/customer/inquiry/list";
		String articleUrl=cp+"/customer/inquiry/article?page="+current_page;
		if(keyword.length()!=0) {
			query="condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl+="?"+query;
			articleUrl+="&"+query;
		}
		
		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("subMenu", "2");
		
		return ".customer.inquiry.list";
	}
	@RequestMapping(value="/customer/inquiry/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception{
		model.addAttribute("mode", "created");
		model.addAttribute("subMenu", "2");
		
		return ".customer.inquiry.created";
	}
	
	@RequestMapping(value="/customer/inquiry/created", method=RequestMethod.POST)
	public String createdSubmit(
			Inquiry dto,
			HttpSession session) throws Exception{
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"inquiry";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		
		service.insertInquiry(dto, pathname);
		
		return "redirect:/customer/inquiry/list";
	}
	
	@RequestMapping(value="/customer/inquiry/article")
	public String article(
			@RequestParam int inquiryNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception{
		keyword=URLDecoder.decode(keyword, "utf-8");
		
		String query="page"+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		Inquiry dto=service.readInquiry(inquiryNum);
		if(dto==null) {
			return "redirect:/customer/inquiry/list?"+query;
		}
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("inquiryNum", inquiryNum);
		
		return ".customer.inquiry.article";
	}
	@RequestMapping(value="/customer/inquiry/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int inquiryNum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception{
		
		Inquiry dto=service.readInquiry(inquiryNum);
		if(dto==null) {
			return "redirect:/customer/inquiry/list?page="+page;
		}
		List<Inquiry> listFile=service.listFile(inquiryNum);
		
		
		return ".customer.inquiry.created";
	}
}