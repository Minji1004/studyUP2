package com.sp.customer.notice;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.sp.common.FileManager;
import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

//공지사항(notice)
@Controller("customer.noticeController")
public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value= {"/customer/notice/list", "/servicecenter/main"})
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="") String spec,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")){
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
		
		List<Notice> noticeList=null;
		if(current_page==1) {
			noticeList=service.listNoticeTop();
		}
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Notice> list=service.listNotice(map);
		
		Date endDate=new Date();
		int listNum, n=0;
		for(Notice dto:list) {
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			
			SimpleDateFormat formatter=new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
			Date beginDate=formatter.parse(dto.getCreated());
		}
		String cp=req.getContextPath();
		String query="";
		String listUrl=cp+"/notice/list";
		String articleUrl=cp+"/notice/article?page="+current_page;
		if(keyword.length()!=0) {
			query="condition="+condition+
					"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl=cp+"/notice/list?"+query;
			articleUrl=cp+"/notice/article?page="+current_page+"&"+query;
		}
		
		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("subMenu", "1");
		return ".customer.notice.list";
	}

	@RequestMapping(value="/customer/notice/created", method=RequestMethod.GET)
	public String createdForm(
			Model model,
			HttpSession session
			) throws Exception {
		//SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		model.addAttribute("mode","created");
		
		model.addAttribute("subMenu", "1");
		return ".customer.notice.created";
	}

	@RequestMapping(value="/customer/notice/created", method=RequestMethod.POST)
	public String createdSubmit(
			Notice dto,
			HttpSession session) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"notice";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		
		service.insertNotice(dto, pathname);
		
		return "redirect:/customer/notice/list";
		
	}

	@RequestMapping(value="/customer/notice/article")
	public String article(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {


		model.addAttribute("subMenu", "1");
		return ".customer.notice.article";
	}

	@RequestMapping(value="/customer/notice/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session,			
			Model model	) throws Exception {
		
		model.addAttribute("subMenu", "1");
		return ".customer.notice.created";
	}

	@RequestMapping(value="/customer/notice/update", method=RequestMethod.POST)
	public String updateSubmit(
			Notice dto,
			@RequestParam String page,
			HttpSession session) throws Exception {

		
		return "redirect:/customer/notice/list?page="+page;
	}

	@RequestMapping(value="/customer/notice/delete", method=RequestMethod.POST)
	public String delete(
			@RequestParam int num,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session) throws Exception {

		return "redirect:/customer/notice/list";
	}

}
