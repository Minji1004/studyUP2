package com.sp.study.mystudy.notice;

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

import com.sp.common.FileManager;
import com.sp.common.MyFile;
import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;
import com.sp.study.Study;
import com.sp.study.StudyService;

@Controller("snotice.noticeController")
public class NoticeController {
	@Autowired
	private StudyService study;
	@Autowired
	private NoticeService service;
	@Autowired MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/study/notice/list", method=RequestMethod.GET)
	public String list(
			Model model,
			@RequestParam int studyNum,
			@RequestParam int left,
			@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="all") String condition,
			HttpServletRequest req) throws Exception {
		
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("keyword", keyword);
        map.put("studyNum", studyNum);

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows,  dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 1페이지인 경우 공지리스트 가져오기
        List<Notice> noticeList = null;
        if(current_page==1) {
          noticeList=service.listNoticeTop(map);
        }
        
        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page-1) * rows;
		if(start < 0) start = 0;
		map.put("start", start);
		map.put("rows", rows);
		
        // 글 리스트
        List<Notice> list = service.listNotice(map);

        // 리스트의 번호
        Date endDate = new Date();
        long gap;
        int listNum, n = 0;
        
        for(Notice dto : list) {
            listNum = dataCount - (start + n);
            dto.setListNum(listNum);
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date beginDate = formatter.parse(dto.getCreated());

            gap=(endDate.getTime() - beginDate.getTime()) / (60*60* 1000);
            dto.setGap(gap);
            
            dto.setCreated(dto.getCreated().substring(0, 10));
            
            n++;
        }
        
        String cp=req.getContextPath();
        String query = "studyNum="+studyNum+"&left="+left;
        String listUrl = cp+"/study/notice/list";
        String articleUrl = cp+"/study/notice/article?page=" + current_page;
        if(keyword.length()!=0) {
        	query = "condition=" +condition + 
        	         "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/study/notice/list?" + query;
        	articleUrl = cp+"/study/notice/article?page=" + current_page + "&"+ query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);		
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);		
		
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		
		
		Study dto = study.readStudy(studyNum);
		
		model.addAttribute("dto", dto);
		
		return ".study.notice.list";
	}
	
	
	@RequestMapping(value="/study/notice/created", method=RequestMethod.GET)
	public String createdFrom(
			Model model,
			@RequestParam int studyNum,
			@RequestParam int left,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/member/login";
		}
		
		Study myStudy = study.readStudy(studyNum);
		String masterId = myStudy.getUserId();
		
		
		if(! info.getUserId().equals(masterId)) {
			
			return "redirect:/study/notice/list";
		}
		
		
		model.addAttribute("mode", "created");
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		
		
		return ".study.notice.created";
	}
	
	@RequestMapping(value="/study/notice/created", method=RequestMethod.POST)
	public String createdSubmit(
			Notice dto,
			HttpSession session,
			@RequestParam int studyNum,
			@RequestParam int left) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/member/login";
		}
		
		Study myStudy = study.readStudy(studyNum);
		String masterId = myStudy.getUserId();
		
		
		if(info.getUserId().equals(masterId)) {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator+"snotice";
			
			dto.setUserId(masterId);
			service.insertNotice(dto, pathname);
			
		}			
		
		return "redirect:/study/notice/list?studyNum="+studyNum+"&left="+left;
	}
	
	@RequestMapping(value="/study/notice/article")
	public String readArticel(
			@RequestParam int studyNum,
			@RequestParam int sNoticeNum,
			@RequestParam int left,@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="all") String condition,			
			Model model) throws Exception {
		
		try {
			service.updateHitCount(sNoticeNum);
		} catch (Exception e) {
			return "redirect:/study/notice/list?studyNum="+studyNum+"&left="+left;
		}
		
		Notice notice = service.readNotice(sNoticeNum);
		List<MyFile> listFile = service.listFile(sNoticeNum);
		
		String query = "studyNum="+studyNum+"&left="+left;
        if(keyword.length()!=0) {
        	query = "condition=" +condition + 
        	         "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
        keyword = URLDecoder.decode(keyword, "utf-8");
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("keyword", keyword);
        map.put("studyNum", studyNum);
        map.put("sNoticeNum", sNoticeNum);
        
        Notice preReadDto = service.preReadNotice(map);
        Notice nextReadDto = service.nextReadNotice(map);
        
        model.addAttribute("left", left);
        model.addAttribute("query", query);
        model.addAttribute("dto", notice);
        model.addAttribute("listFile", listFile);
        model.addAttribute("studyNum", studyNum);
        
        model.addAttribute("preReadDto", preReadDto);
        model.addAttribute("nextReadDto", nextReadDto);	
		
		return ".study.notice.article";
	}
	
	@RequestMapping(value="/study/notice/downloadFile", method=RequestMethod.GET)
	public void download(
			@RequestParam int snFileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "snotice";

		boolean b = false;
		
		Notice dto = service.readFile(snFileNum);
		
		if(dto!=null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if (!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}		
		
	}
	
	@RequestMapping(value="/study/notice/downloadZip", method=RequestMethod.GET)
	public void downloadZip( 
			@RequestParam int sNoticeNum, 
			HttpServletResponse resp, 
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root +"uploads" + File.separator + "snotice";
		
		boolean b = false;
		
		List<MyFile> fileList = service.listFile(sNoticeNum);
		
		b = fileManager.downloadZip(resp, pathname, fileList);
		if (!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}	
	}
	
	@RequestMapping(value="/study/notice/update", method=RequestMethod.GET)
	public String updateForm(
			Model model,
			@RequestParam int studyNum,
			@RequestParam int sNoticeNum,
			@RequestParam int left,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/member/login";
		}
		
		Study myStudy = study.readStudy(studyNum);
		String masterId = myStudy.getUserId();
		
		
		if(! info.getUserId().equals(masterId)) {
			
			return "redirect:/study/notice/list";
		}
		
		Notice dto = service.readNotice(sNoticeNum);
		if(dto == null) {
			return "redirect:/study/notice/list?studyNum="+studyNum+"&left="+left+"&page="+page;
		}
		
		
		List<MyFile> listFile = service.listFile(sNoticeNum); 
		
		
		model.addAttribute("mode", "update");
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);		
		
		return ".study.notice.created";
	}
	
	@RequestMapping(value="/study/notice/update", method=RequestMethod.POST)
	public String updateSubmit(
			Notice dto,
			@RequestParam int studyNum,
			@RequestParam int sNoticeNum,
			@RequestParam int left,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		Study myStudy = study.readStudy(studyNum);
		String masterId = myStudy.getUserId();
		
		
		if(info.getUserId().equals(masterId)) {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator+"snotice";
			
			dto.setUserId(masterId);
			service.insertNotice(dto, pathname);
			
		}		
		
		return "redirect:/study/notice/list?studyNum="+studyNum+"&left="+left+"&page="+page;

	}
	
	@RequestMapping(value="/study/notice/delete")
	public String delete(
			@RequestParam int studyNum,
			@RequestParam int sNoticeNum,
			@RequestParam int left,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query= "studyNum="+studyNum+"&left="+left+"&page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		Study myStudy = study.readStudy(studyNum);
		String masterId = myStudy.getUserId();
		
		
		if(! info.getUserId().equals(masterId)) {
			return "redirect:/study/notice/list?"+query;
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator +"uploads" + File.separator + "notice";
		
		service.deleteNotice(sNoticeNum, pathname);
		
		return "redirect:/study/notice/list?"+query;
	}	

}
