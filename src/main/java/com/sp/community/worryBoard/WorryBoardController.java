package com.sp.community.worryBoard;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("worryBoard.worryboardController")
public class WorryBoardController {
	@Autowired
	private WorryBoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("/community/worryBoard/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows=10;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "UTF-8");
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount=service.dataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows;
		if(start<0) start=0;
		
		map.put("start", start);
		map.put("rows", rows);
		
		List<WorryBoard> list=service.listWorryBoard(map);

		// 글번호 만들기
		int listNum, n=0;
		Iterator<WorryBoard> it=list.iterator();
		while(it.hasNext()) {
			WorryBoard data=it.next();
			listNum=dataCount-(start+n-1);
			data.setListNum(listNum);
			n++;
		}
		
		// ajax 페이징 처리
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "community/worryBoard/list";
	}
	
	@RequestMapping(value="/community/worryBoard/created", method=RequestMethod.GET) 
	public String createdForm(
			Model model
			) throws Exception{
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		
		return "community/worryBoard/created";
	}
	
	@RequestMapping(value="/community/worryBoard/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			WorryBoard dto,
			HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		dto.setUserId(info.getUserId());
		service.insertWorryBoard(dto, "created");
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/community/worryBoard/article")
	public String article(
			@RequestParam int worryPostNum,
			@RequestParam String pageNo,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception{
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		service.updateHitCount(worryPostNum);
		
		WorryBoard dto=service.readWorryBoard(worryPostNum);
		if(dto==null) {
			return "community/error";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("groupNum", dto.getGroupNum());
		map.put("orderNo", dto.getOrderNo());
		
		WorryBoard preReadDto=service.preReadWorryBoard(map);
		WorryBoard nextReadDto=service.nextReadWorryBoard(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("pageNo", pageNo);
		
		return "community/worryBoard/article";
	}
	
	@RequestMapping(value="/community/worryBoard/update", method=RequestMethod.GET)
	public String updataForm(
			@RequestParam int worryPostNum,
			@RequestParam String pageNo,
			HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		WorryBoard dto=service.readWorryBoard(worryPostNum);
		if(dto==null) {
			return "community/error";
		}
		if(! info.getUserId().equals(dto.getUserId())) {
			return "community/error";
		}
		
		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);
		
		return"community/worryBoard/created";
	}
			
	@RequestMapping(value="/community/worryBoard/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			WorryBoard dto,
			HttpSession session) throws Exception{
		
		String state="true";
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		service.updateWorryBoard(dto);
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/community/worryBoard/reply", method=RequestMethod.GET)
	public String replyForm(
			@RequestParam int worryPostNum,
			@RequestParam String pageNo,
			HttpSession session,
			Model model) throws Exception{
	
	
	WorryBoard dto=service.readWorryBoard(worryPostNum);
	
	if(dto==null) {
		return "community/error";
	}
	
	String str="["+dto.getSubject()+"] 에 대한 답변입니다. \n";
	dto.setContent(str);
	
	model.addAttribute("dto", dto);
	model.addAttribute("pageNo", pageNo);
	model.addAttribute("mode", "reply");
	
	return "community/worryBoard/created";
	}
	
	@RequestMapping(value="/community/worryBoard/reply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replySubmit(
			WorryBoard dto,
			HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		dto.setUserId(info.getUserId());
		service.insertWorryBoard(dto, "reply");
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/community/worryBoard/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int worryPostNum,
			HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		WorryBoard dto=service.readWorryBoard(worryPostNum);
		
		if(dto!=null) {
			if(info.getUserType().get(0)==1 || info.getUserId().equals(dto.getUserId())){
			service.deleteWorryBoard(worryPostNum);
			state="true";
			}
		}
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
}