package com.sp.teacher;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("teacher.comentController")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private TeacherUtil teacherUtil;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/teacher/listComment" , method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> listComment(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam int tnum
			) throws Exception{
		
		Map<String, Object> model = new HashMap<>();
		
		int rows = 3;
		int total_page;
		int dataCount;
		double avgScore;
		
		Map<String, Object> map = new HashMap<>();
		map.put("tnum", tnum);	
		
		dataCount = commentService.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);		

		if(total_page<current_page)
			current_page = total_page;
		
		int start = (current_page-1)*rows; //0부터 시작
		if(start<0) start=0; //LIMIT에서 시작이 음수이면 오류 발생
		map.put("start", start);
		map.put("rows", rows);
		
		List<Comment> list = commentService.listComment(map);
		
		String paging = teacherUtil.paging(current_page, total_page);
		
		avgScore = commentService.readAvgScore(tnum);
		
		model.put("avgScore", avgScore);
		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("page", current_page);
		model.put("total_page", total_page);
		model.put("paging", paging);
		
		return model;
	}
	
	
	@RequestMapping(value ="/teacher/insertComment", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertComment(
			@RequestParam int tnum, 
			@RequestParam int score,  
			@RequestParam String content, 
			HttpSession session) throws Exception{
		
		Map<String, Object> model = new HashMap<>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int snum = info.getUserNum();
		Comment dto = new Comment();		
		dto.setSnum(snum);
		dto.setTnum(tnum);
		dto.setScore(score);
		dto.setContent(content);
				
		try {
			commentService.insertComment(dto);
			model.put("state", "true");
		}catch(Exception e){
			model.put("state", "false");
		}	
				
		return model;
	}
	
	@RequestMapping(value ="/teacher/deleteComment", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertComment(@RequestParam int num) throws Exception{
		
		Map<String, Object> model = new HashMap<>();				
		try {
			commentService.deleteComment(num);
			model.put("state", "true");
		}catch(Exception e){
			model.put("state", "false");
		}	
				
		return model;
	}
}
