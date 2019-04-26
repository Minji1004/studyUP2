package com.sp.study;

import java.io.File;
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

@Controller("study.studyController")
public class StudyController {
	@Autowired
	private StudyService service;	
	@Autowired
	private CategoryService categoryService;	
	@Autowired
	private ApplyStudyService applyService;
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value="/study/main")
	public String main() {
		return ".four.study.main";
	}
	
	@RequestMapping(value="/study/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="allStudy") String mode,
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
		// System.out.println("여기!!!!!! "+categoryName);
		
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
		
		// model.addAttribute("mode", mode);
		// model.addAttribute("categoryName", categoryName);
		
		return "study/list";
	}	
	
	// 모달창 띄우기
	@RequestMapping(value="/study/studyDetail")
	public String studyDetail(
			@RequestParam int studyNum,
			Model model) throws Exception {
		
		Study dto = service.readStudy(studyNum);
		if(dto==null)
			return "redirect:/study/main";
		
		dto.setStudyIntro(myUtil.htmlSymbols(dto.getStudyIntro()));
		
		model.addAttribute("dto", dto);
		
		return "study/studyDetail";
	}	
	
	// 모달창 띄우기
	@RequestMapping(value="/study/makeStudy", method=RequestMethod.GET)
	public String makeStudy(Model model) {
		model.addAttribute("mode", "makeStudy");
		
		// 카테고리 가져오기
		List<Category> list = categoryService.listCategory();
		model.addAttribute("categorylist", list);
		System.out.println(list);
		
		return "study/makeStudy";
	}
	
	@RequestMapping(value="/study/makeStudy", method=RequestMethod.POST)
	public String makeStudySubmit(
			Study dto,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root +"uploads"+File.separator+"study";
		
		dto.setUserId(info.getUserId());
		dto.setUserName(info.getUserName());
		
		service.insertStudy(dto, pathname);
		
		return "redirect:/study/main";
	}
		
	// 과목 가져오기
	@RequestMapping(value="/study/course")
	@ResponseBody
	public Map<String, Object> courseList(
			@RequestParam int categoryNum
			) throws Exception {
		List<Category> listCourse = categoryService.listCourse(categoryNum);
		
		Map<String, Object> model = new HashMap<>();
		model.put("listCourse", listCourse);
		
		return model;		
	} 
	
	// 가입신청 - apply for study	
	@RequestMapping(value="/study/applyStudy", method=RequestMethod.GET)
	public String applyStudy() {
		return "study/applyStudy";
	}
	
	@RequestMapping(value="/study/applyStudy", method=RequestMethod.POST)
	public String applyStudySubmit(
			@RequestParam int studyNum,
			ApplyStudy dto,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		dto.setStudyNum(studyNum);
		dto.setUserId(info.getUserId());
		applyService.applyStudy(dto);
		
		return "redirect:/study/main";
	}
	
	

}
