package com.sp.teacher.notice;

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
import com.sp.teacher.Teacher;
import com.sp.teacher.TeacherService;
import com.sp.teacher.TeacherUtil;

@Controller("teacher.teacher.teacherNoticeController")
public class TeacherNoticeController {
	
	@Autowired
	TeacherService teacherService;
	
	@Autowired
	TeacherNoticeService teacherNoticeService;
	
	@Autowired
	MyUtil myUtil;
	
	@Autowired
	TeacherUtil teacherUtil;
	
	@RequestMapping(value ="/teacher/notice/list", method=RequestMethod.GET)
	public String teacherLecture(@RequestParam int tnum,
			@RequestParam int left, 
			@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="all") String condition,
			HttpServletRequest req,
			Model model) throws Exception{		
		
		Teacher teacher = teacherService.readTeacher(tnum);
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		keyword=URLDecoder.decode(keyword, "utf-8");
	
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount= teacherNoticeService.dataCount(map);
		
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			current_page=total_page;
		
		List<TeacherNotice> noticeList=null;
		if(current_page==1) {
			noticeList=teacherNoticeService.listNoticeTop();
		}
		
		int start=(current_page-1)*rows;
		if(start<0) start=0;
		
		map.put("start", start);
		map.put("rows", rows);
		
		List<TeacherNotice> list = teacherNoticeService.listTNotice(map);
		
		int listNum, n=0;
		for(TeacherNotice dto:list) {
			listNum=dataCount-(start+n);
			dto.setListNum(listNum);			
			n++;
		}
		
		String cp=req.getContextPath();
		String query="";
		String listUrl=cp+"/teacher/notice/list";
		String articleUrl=cp+"/teacher/notice/article?page="+current_page;
		if(keyword.length()!=0) {
			query="condition="+condition+
					"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl+="?"+query;
			articleUrl+="&"+query;
		}
		
		String paging= teacherUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);	
		
		model.addAttribute("teacher", teacher);
		model.addAttribute("tnum", tnum);
		model.addAttribute("left", left);
		
		return ".teacher.notice.notice";
	}
	
	@RequestMapping(value ="/teacher/notice/created", method=RequestMethod.GET)
	public String createNotice(@RequestParam int tnum, @RequestParam int left, Model model) throws Exception{		
		
		Teacher teacher = teacherService.readTeacher(tnum);
		
		model.addAttribute("teacher", teacher);
		model.addAttribute("tnum", tnum);
		model.addAttribute("left", left);	
		
		return ".teacher.notice.created";
	}
	
	@RequestMapping(value ="/teacher/notice/created", method=RequestMethod.POST)
	public String createNotice(TeacherNotice dto, HttpSession session) throws Exception{		
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"tnotice";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.settId(info.getUserId());		
		int tnum = info.getUserNum();

		try {			
			teacherNoticeService.insertNotice(dto, pathname);			
			
		}catch(Exception e) {
			e.printStackTrace();
			}

		return "redirect:/teacher/notice/list?tnum="+tnum+"&left=2";
	}

}
