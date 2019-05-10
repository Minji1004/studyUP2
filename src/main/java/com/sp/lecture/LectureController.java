package com.sp.lecture;

import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;
import com.sp.study.Study;

@Controller("lecture.lectureController")
public class LectureController {
	
	@Autowired
	private LectureService service;	
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value ="/lecture/main", method=RequestMethod.GET)
	public String main(HttpSession session) {		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info.getUserType().contains(1)) {
			return ".admins.lecture.main";
		}
		return ".four.lecture.main";
	}
	@RequestMapping(value="/lecture/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="allStudy") String mode,
			@RequestParam(defaultValue="") String userId,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows = 6;
		int total_page = 0;
		int dataCount = 0;
		
		String categoryName = "";
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}		
		
		
		if(mode.equals("csat")) {
			categoryName = URLDecoder.decode("수능", "utf-8");
		} else if(mode.equals("toeic")) {
			categoryName = URLDecoder.decode("토익", "utf-8");
		} else if(mode.equals("exam9")) {
			categoryName = URLDecoder.decode("9급공시", "utf-8");
		} else if(mode.equals("exam7")) {
			categoryName = URLDecoder.decode("7급공시", "utf-8");
		} 	
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("mode", mode);
		map.put("categoryName", categoryName);
		
		map.put("userId", userId);

		dataCount = service.dataCount(map);
		
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page-1) * rows;
		if(start < 0) start = 0;
		map.put("start", start);
		map.put("rows", rows);
		
		List<Study> list = service.listStudy(map);
		        
        String paging = myUtil.pagingMethod(current_page, total_page, "listStudy");       
        

        model.addAttribute("list", list);
        model.addAttribute("pageNo", current_page);
        model.addAttribute("total_page", total_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("paging", paging);
		
		return "lecture/list";
	}	
	
	@RequestMapping(value="/lecture/lectureDetail")
	public String lectureDetail(
			@RequestParam int studyNum,
			Model model) throws Exception {
		
		Study dto = service.readLecture(studyNum);
		if(dto==null)
			return "redirect:/lecture/main";
		
		dto.setStudyIntro(myUtil.htmlSymbols(dto.getStudyIntro()));		
		dto.setApplyCount(service.headCount(studyNum));
		
		model.addAttribute("dto", dto);
		
		return "lecture/lectureDetail";
	}	
	
	
	@RequestMapping(value="/payments/complete")
	@ResponseBody
	public Map<String, Object> buyLecture(@RequestParam int lectureNum,	HttpSession session) throws Exception{
		
		Map<String, Object> model = new HashMap<>();
		
		SessionInfo sessionInfo = (SessionInfo)session.getAttribute("member");
			
		String sId = sessionInfo.getUserId();
		
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNum", lectureNum);
		map.put("sId", sId);
		
		try {
			service.insertStudent(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;		
	}
	
	@RequestMapping(value="/lecture/myLecture")
	public String myLecture(@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="allStudy") String mode,
			@RequestParam(defaultValue="") String userId,
			HttpServletRequest req,
			Model model) throws Exception {	
		int rows = 6;
		int total_page = 0;
		int dataCount = 0;
		
		String categoryName = "";
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}		
		
		
		if(mode.equals("csat")) {
			categoryName = URLDecoder.decode("수능", "utf-8");
		} else if(mode.equals("toeic")) {
			categoryName = URLDecoder.decode("토익", "utf-8");
		} else if(mode.equals("exam9")) {
			categoryName = URLDecoder.decode("9급공시", "utf-8");
		} else if(mode.equals("exam7")) {
			categoryName = URLDecoder.decode("7급공시", "utf-8");
		} 	
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("mode", mode);
		map.put("categoryName", categoryName);
		map.put("userId", userId);

		//dataCount = service.myDataCount(map);
		
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page-1) * rows;
		if(start < 0) start = 0;
		map.put("start", start);
		map.put("rows", rows);
		
		List<Study> list = service.listStudy(map);
		        
        String paging = myUtil.pagingMethod(current_page, total_page, "listStudy");       
        

        model.addAttribute("list", list);
        model.addAttribute("pageNo", current_page);
        model.addAttribute("total_page", total_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("paging", paging);
		
		return "lecture/list";
	}
}
