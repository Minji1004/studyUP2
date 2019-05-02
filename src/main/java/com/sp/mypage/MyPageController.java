package com.sp.mypage;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import com.sp.member.Member;
import com.sp.member.MemberService;
import com.sp.member.SessionInfo;

@Controller("mypage.myPageController")
public class MyPageController {
	@Autowired
	private MemberService memberService;
	@Autowired	
	private FileManager fileManager;
	@Autowired	
	private MypageService mypageService;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/mypage/info")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.menu5.mypage.info";
	}
	
	@RequestMapping(value = "/mypage/main")
	public String main(
			Model model, 
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Member dto =  memberService.readMember(info.getUserId());

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "member_profile";
		
		if(dto.getPicture() != null) {
			//File f= new File(pathname + File.separator + dto.getPicture());
		}
		
		model.addAttribute("dto", dto);

		return ".four.mypage.main";
	}
	
	@RequestMapping(value = "/mypage/basket/main")
	public String basket() throws Exception{
		return ".four.mypage.basket.main";
	}
	
	@RequestMapping(value = "/mypage/study/main")
	public String study() throws Exception{
		return ".four.mypage.study.main";
	}
	
	@RequestMapping(value = "/mypage/studyroom/main")
	public String studyroom() throws Exception{
		return ".four.mypage.studyroom.main";
	}
	
	@RequestMapping(value = "/mypage/schedule/main")
	public String schedule() throws Exception{
		return ".four.mypage.schedule.main";
	}
	
	@RequestMapping(value = "/mypage/wanote/main")
	public String wanote(
			@RequestParam(value="page", defaultValue = "1") int current_page
			,@RequestParam(value = "condition" , defaultValue = "all") String condition
			,@RequestParam(value = "keyword", defaultValue = "")  String keyword
			,HttpServletRequest req
			,Model model) throws Exception{
		
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("condition", condition);
	    map.put("keyword", keyword);
		
	    dataCount = mypageService.dataCount(map);
	    if(dataCount != 0)
	            total_page = myUtil.pageCount(rows,  dataCount) ;
	    if(total_page < current_page) 
	            current_page = total_page;
		
	    int start=(current_page-1)*rows;
		if(start<0) start=0;  // 주의
		map.put("start", start);
		map.put("rows", rows);
	    
		List<Wanote> list = mypageService.listWanote(map);
		
		int listNum , n = 0;
		for(Wanote dto : list) {
			 listNum = dataCount - (start + n);
	         dto.setListNum(listNum);
	         n++;	
		}
		
		String query = "";
        String listUrl;
        String articleUrl;
        if(keyword.length()!=0) {
        	query = "condition=" +condition + 
   	             "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
        String cp = req.getContextPath();
        listUrl = cp + "/mypage/wanote/main";
        articleUrl = cp+"/mypage/wanote/article?page=" + current_page;
        if(query.length()!=0) {
        	listUrl = listUrl + "?" + query;
            articleUrl = articleUrl + "&"+ query;
        }
        String paging = myUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("pageNo", current_page);
        model.addAttribute("total_page", total_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
        
		return ".four.mypage.wanote.main";
	}
	
	@RequestMapping(value = "/mypage/update", method = RequestMethod.GET)
	public String mypageProfileUpdateForm(
			@RequestParam String userId,
			HttpSession session,
			Model model) {
		
		Member dto =  memberService.readMember(userId);
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "member_profile";
		
		if(dto.getPicture() != null) {
			//File f= new File(pathname + File.separator + dto.getPicture());
		}
		
		model.addAttribute("dto",dto);
		
		return "mypage/update";
	}
	
	@RequestMapping(value = "/mypage/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mypageProfileUpdateSubmit(
			Member dto,
			HttpSession session,
			HttpServletRequest req
			) throws Exception{
		
		Map<String, Object> model = new HashMap<>();
		if(dto.getPictureM() != null) {
			String root =  session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "member_profile";
			
			String saveFilename = fileManager.doFileUpload(dto.getPictureM(), pathname);
			if(saveFilename!=null) {
				dto.setPicture(saveFilename);
			}
		}
		
		int result = mypageService.updateProfile(dto);
		
		if(result == 0) {
			model.put("state", "false");
		}else {
			model.put("state", "true");
		}

		return model;
	}
	
	@RequestMapping(value = "/mypage/wanote/created", method = RequestMethod.GET)
	public String wanoteCreatedForm(Model model) {
		
		model.addAttribute("mode", "created");
		
		return "mypage/wanote/created";
	}
	
	@RequestMapping(value = "/mypage/wanote/created", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> wanoteCreatedSubmit(
			Wanote dto
			,Model model
			,HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<>();
		
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "wanote";		
		
		mypageService.insertWanote(dto, pathname);
		
		return map;
	}
	
	@RequestMapping(value = "/mypage/wanote/article" ,method = RequestMethod.GET)
	public String wanoteArticle(
			@RequestParam int waNum,
			@RequestParam int page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model,
			HttpServletRequest req
			) throws Exception {
		keyword = URLDecoder.decode(keyword, "utf-8");
		String cp = req.getContextPath();
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		Wanote dto = mypageService.readWanote(waNum);
		
		List<WanoteFileDTO> flist = mypageService.readWanoteFile(waNum);
		
		if(dto == null) {
			model.addAttribute("wanoteNull",0);
			return "mypage/wanote/main";
		}
		
		if(dto != null) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("waNum", waNum);
		
		Wanote preReadDto = mypageService.preReadWanote(map);
		Wanote nextReadDto = mypageService.nextReadWanote(map);

		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("flist", flist);
		
		
		return "/mypage/wanote/article";
	}

	@RequestMapping(value ="/wanote/article/download")
	public void download(
			@RequestParam int wanoteFileNum,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session
			)throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "wanote";
		
		WanoteFileDTO dto = mypageService.readWanoteFileOne(wanoteFileNum);
		
		if(dto != null) {
			boolean b = fileManager.doFileDownload(dto.getSaveFilename(), dto.getOriginalFilename(), pathname, resp);
			if(b) return;
		}
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<script>alert('파일 다운로드를 실패했습니다.');history.back();</script>"); 

	}
}
