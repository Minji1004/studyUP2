package com.sp.customer.faq;

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

@Controller("faq.faqController")
public class FaqController {
	@Autowired 
	private FaqService service;
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value= {"/customer/faq/list"})
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
		
		Map<String, Object> map=new HashMap<String, Object>();
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
		
		List<Faq> list=service.listFaq(map);
		
		int listNum, n=0;
		for(Faq dto:list) {
			listNum=dataCount-(start+n);
			dto.setListNum(listNum);
			
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			n++;
		}
		
		String cp=req.getContextPath();
		String query="";
		String listUrl=cp+"/customer/faq/list";
		String articleUrl=cp+"/customer/faq/article?page="+current_page;
		if(keyword.length()!=0) {
			query="condition="+condition+
					"&keyword="+URLEncoder.encode(keyword, "utf-8");
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
		model.addAttribute("query", query);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("subMenu", "3");
		return ".customer.faq.list";
	}

	@RequestMapping(value="/customer/faq/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception{
		/*
		SessionInfo info=(SessionInfo)session.getAttribute("memberInfo");
		
		if(! info.getUserId().equals("admin")) {
			return "redirect:/customer/faq/list";
		}
		*/
		model.addAttribute("mode", "created");
		return ".customer.faq.created";
	}
	
	@RequestMapping(value="/customer/faq/created", method=RequestMethod.POST)
	public String createdSubmit(
			Faq dto
			,HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(dto!=null) {
			dto.setUserId(info.getUserId());
			service.insertFaq(dto);
		}
		
		/*
		SessionInfo info=(SessionInfo)session.getAttribute("admin");
		
		if(info.getUserId().equals("admin")) {
			
			dto.setUserId(info.getUserId());
			
		}
		*/
		return "redirect:/customer/faq/list";
	}
	
	@RequestMapping(value="/customer/faq/article")
	public String article(
			@RequestParam int faqNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model)throws Exception{
		keyword=URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
	
		Faq dto=service.readFaq(faqNum);
		if(dto==null) {
			return "redirect:/customer/faq/list?"+query;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("page", page);
		
		return ".customer.faq.article";
	}
	
	@RequestMapping(value="/customer/faq/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int faqNum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception{
		/*	
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(! info.getUserId().equals("admin")) {
			return "redirect:/customer/faq/list?page="+page;
		}
		 */
		Faq dto=service.readFaq(faqNum);
		if(dto==null) {
			return "redirect:/customer/faq/list?page="+page;
		}
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("page",page);
		
		
	return ".customer.faq.created";
	}
	
	
	@RequestMapping(value="/customer/faq/update", method=RequestMethod.POST)
	public String updateSubmit(
			Faq dto,
			@RequestParam String page
			) throws Exception{
		/*
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		 if(info.getUserId().equals("admin")) {
			dto.setUserId(info.getUserId());
			
		 }*/
		service.updateFaq(dto);
		
		return "redirect:/customer/faq/list?page="+page;
	}
	
	@RequestMapping(value="/customer/faq/delete")
	public String delete(
			@RequestParam int faqNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session)throws Exception{
		//SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String query="page="+page;
		keyword=URLDecoder.decode(keyword, "utf-8");
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
/*		
		if(! info.getUserId().equals("admin")) {
			return "redirect:/customer/faq/list?"+query;
		}				
*/		
		service.deleteFaq(faqNum);
		
		return "redirect:/customer/faq/list?"+query;
	}
}
