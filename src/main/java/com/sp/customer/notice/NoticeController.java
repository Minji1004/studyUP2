package com.sp.customer.notice;

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
			HttpServletRequest req,
			Model model) throws Exception {
		
		model.addAttribute("subMenu", "1");
		return ".customer.notice.list";
	}

	@RequestMapping(value="/customer/notice/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {

		model.addAttribute("subMenu", "1");
		return ".customer.notice.created";
	}

	@RequestMapping(value="/customer/notice/created", method=RequestMethod.POST)
	public String createdSubmit(
			Notice dto,
			HttpSession session) throws Exception {
		
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
