package com.sp.community.worryBoard;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.FileManager;
import com.sp.common.MyUtil;

@Controller("worboard.worboardController")
public class WorryBoardController {
	@Autowired
	private WorryBoardService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping("/community/worryBoard/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		
		return "community/worryBoard/list";
	}
	
	@RequestMapping(value="/community/worryBoard/created", method=RequestMethod.GET) 
	public String createdForm(Model model) throws Exception{
		model.addAttribute("pageNo","1");
		model.addAttribute("mode","created");
		
		return "community/worryBoard/created";
	}
	
	@RequestMapping(value="/community/worryBoard/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(WorryBoard dto, HttpSession session)
			throws Exception{
		
		
		Map<String, Object> model=new HashMap<>();
		return model;
		
	}
	
	@RequestMapping(value="/community/worryBoard/article")
	public String article(
			@RequestParam int num,
			@RequestParam String pageNo,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception{
				

		return "community/worryBoard/article";
	}
	

}
