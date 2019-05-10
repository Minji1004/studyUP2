package com.sp.community.worryBoard;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.sp.member.SessionInfo;

@Controller("worryboard.WorryBoardController")
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
		
		List<WorryBoard> worryboardList=null;
		if(current_page==1) {
			worryboardList=service.listWorryBoardTop();
		}
		
		int start=(current_page-1)*rows;
		if(start<0) start=0;
		
		map.put("start", start);
		map.put("rows", rows);
		
		List<WorryBoard> list=service.listWorryBoard(map);
		
		Date endDate=new Date();
		long gap;
		int listNum, n=0;
		for(WorryBoard dto:list) {
			listNum=dataCount-(start+n);
			dto.setListNum(listNum);
			
			SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate=formatter.parse(dto.getCreated());
			gap=(endDate.getTime()-beginDate.getTime())/(60*60*1000);
			dto.setGap(gap);
			
			dto.setCreated(dto.getCreated().substring(0, 10));
			
			n++;
		}
		
		String cp=req.getContextPath();
		String query="";
		String listUrl=cp+"/community/worryBoard/list";
		String articleUrl=cp+"/community/worryBoard/article?page="+current_page;
		if(keyword.length()!=0) {
			query="condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl+="?"+query;
			articleUrl+="&"+query;
		}
		
		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("worryboardList", worryboardList);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("subMenu", "4");
		return ".community.worryBoard.list";
	}
	
	@RequestMapping(value="/community/worryBoard/created", method=RequestMethod.GET) 
	public String createdForm(Model model) throws Exception{
		
		model.addAttribute("mode", "created");
		model.addAttribute("subMenu", "4");
		
		return ".community.worryBoard.created";
	}
	
	@RequestMapping(value="/community/worryBoard/created", method=RequestMethod.POST)
	@ResponseBody
	public String createdSubmit(WorryBoard dto,
			HttpSession session) throws Exception{
			
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"worryBoard";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		
		service.insertWorryBoard(dto, pathname);
		
		return "redirect:/community/worryBoard/list";
	}
	
	@RequestMapping(value="/community/worryBoard/article")
	public String article(
			@RequestParam int worryPostnum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception{
				
		keyword=URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		service.updateHitCount(worryPostnum);
		
		WorryBoard dto=service.readWorryBoard(worryPostnum);
		if(dto==null) {
			return "redirect:/community/worryBoard/list?"+query;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("worryPostnum", worryPostnum);
		
		WorryBoard preReadDto=service.preReadWorryBoard(map);
		WorryBoard nextReadDto=service.preReadWorryBoard(map);
		
		List<WorryBoard> listFile=service.listFile(worryPostnum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		model.addAttribute("subMenu", "4");
		
		return ".community.worryBoard.article";
	}
	
	@RequestMapping(value="community/worryBoard/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int worryPostnum,
			@RequestParam String page,
			Model model) throws Exception{
		
		WorryBoard dto=service.readWorryBoard(worryPostnum);
		if(dto==null) {
			return "redirect:/community/worryBoared/list?page="+page;
		}
		List<WorryBoard> listFile=service.listFile(worryPostnum);
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		
		model.addAttribute("subMenu", "4");
		
		return ".community.worryBoard.created";
	}
	
	@RequestMapping(value="/community/worryBoard/update", method=RequestMethod.POST)
	public String updateSubmit(
			WorryBoard dto,
			@RequestParam String page
			) throws Exception{
		
		service.updateWorryBoard(dto, page);
		return "redirect:/community/worryBoard/list?page="+page;
	}
	
	@RequestMapping(value="/community/worryBoard/delete")
	public String delete(
			@RequestParam int worryPostnum,
			@RequestParam(value="page") String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session) throws Exception{
	
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"worryBoard";
		
		String query="page="+page;
		keyword=URLDecoder.decode(keyword, "utf-8");
		if(keyword.length()!=0) {
			query+="&condition"+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		service.deleteWorryBoard(worryPostnum, pathname);
		
	return "redirect:/community/worryBoard/list"+query;
	}
	
	@RequestMapping(value="/community/worryBoard/download")
	public void download(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception{
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"worryBoard";
		
		boolean b=false;
		
		WorryBoard dto=service.readFile(fileNum);
		if(dto!=null) {
			String saveFilename=dto.getSaveFilename();
			String originalFilename=dto.getOriginalFilename();
			
			b=fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if(! b) {
			try {
				resp.setContentType("text/html); charset=utf-8");
				PrintWriter out=resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능합니다!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	@RequestMapping(value="/community/worryBoard/deleteFile", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception{
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"worryBoard";
		
		WorryBoard dto=service.readFile(fileNum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
		}
		
		//service.deleteFile2(fileNum);
	
		Map<String, Object> model=new HashMap<>();
		model.put("state", "true");
		return model;	
	
	}
}