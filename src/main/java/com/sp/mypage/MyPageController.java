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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		if(info == null) {
			return "member/login";
		}
		Member dto =  memberService.readMember(info.getUserId());
		
		model.addAttribute("dto", dto);
		model.addAttribute("active", "1");
		
		return ".four.mypage.main";
	}
	
	@RequestMapping(value = "/mypage/basket/main")
	public String basket(
			Model model
			) throws Exception{
		
		model.addAttribute("active", "4");
		
		return ".four.mypage.basket.main";
	}
	
	@RequestMapping(value = "/mypage/study/main")
	public String study(
			Model model
			) throws Exception{
		
		model.addAttribute("active", "5");
		
		return ".four.mypage.study.main";
	}
	
	@RequestMapping(value = "/mypage/studyroom/main")
	public String studyroom(
			Model model
			) throws Exception{
		
		model.addAttribute("active", "6");
		
		return ".four.mypage.studyroom.main";
	}
	
	@RequestMapping(value = "/mypage/schedule/main")
	public String schedule(
			Model model
			) throws Exception{
		
		model.addAttribute("active", "3");
		
		return ".four.mypage.schedule.main";
	}
	
	@RequestMapping(value = "/mypage/wanote/main")
	public String wanote(
			@RequestParam(value="page", defaultValue = "1") int current_page
			,@RequestParam(value = "condition" , defaultValue = "all") String condition
			,@RequestParam(value = "keyword", defaultValue = "")  String keyword
			,HttpServletRequest req
			,HttpSession session
			,Model model) throws Exception{
		
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("condition", condition);
	    map.put("keyword", keyword);
	    map.put("userId", info.getUserId());
		
	    dataCount = mypageService.dataCount(map);
	    if(dataCount != 0)
	            total_page = myUtil.pageCount(rows,  dataCount) ;
	    if(total_page < current_page) 
	            current_page = total_page;
		
	    int start=(current_page-1)*rows;
		if(start<0) start=0;  // 주의
		map.put("start", start);
		map.put("rows", rows);
		
		
		map.put("userId", info.getUserId());
	    
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
        
		model.addAttribute("active", "2");
		
		return ".four.mypage.wanote.main";
	}
	
	@RequestMapping(value = "/mypage/update", method = RequestMethod.GET)
	public String mypageProfileUpdateForm(
			@RequestParam String userId,
			HttpSession session,
			Model model) {
		
		Member dto =  memberService.readMember(userId);
		
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
	
	@RequestMapping(value ="/mypage/wanote/update" , method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int waNum,
			Model model) {
		
		Wanote dto = mypageService.readWanote(waNum);
		List<WanoteFileDTO> flist =mypageService.readWanoteFile(waNum);
		
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("flist", flist);
		
		return "mypage/wanote/created";
	}
	
	@RequestMapping(value ="/mypage/wanote/update/deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int wanoteFileNum	
			,HttpSession session
			) throws Exception{
	
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "wanote";
		
		
		String state = "true";
		Map<String, Object> model = new HashMap<>();
		WanoteFileDTO fdto = mypageService.readWanoteFileOne(wanoteFileNum);
		
		if(fdto == null) {
			state = "false";
			model.put("state", state);
			return model;
		}
		
		if(fdto.getSaveFilename() != null) {
			fileManager.doFileDelete(fdto.getSaveFilename(), pathname);
			fdto.setSaveFilename("");
			fdto.setOriginalFilename("");
			mypageService.deleteWanoteFile(fdto);
		}
		
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value = "/mypage/wanote/delete", method=RequestMethod.POST)
	@ResponseBody	
	public Map<String, Object> deleteWanote(
			@RequestParam int waNum,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value ="condition", defaultValue = "all") String condition,
			HttpSession session
			) throws Exception{
		
		keyword = URLEncoder.encode(keyword, "utf-8");	
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "wanote";
		
		
		String state = "true";
		Map<String, Object> model = new HashMap<>();
		List<WanoteFileDTO> flist = mypageService.readWanoteFile(waNum);
		if(flist != null) {
			for(WanoteFileDTO fdto : flist) {
				fileManager.doFileDelete(fdto.getSaveFilename(), pathname);
				mypageService.deleteWanoteFile(waNum);
			}
		}
		
		mypageService.deleteWanote(waNum);	//삭제
		
		model.put("page", page);
		model.put("keyword", keyword);
		model.put("condition", condition);
		model.put("state", state);
		
		return model;
	}
	
	@SuppressWarnings({ "unused", "null" })
	@RequestMapping(value = "/mypage/wanote/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateWanoteSubmit(
			Wanote dto,
			@RequestParam String page, 
			HttpSession session,
			HttpServletRequest req) throws Exception {
		
		Map<String, Object> model = new HashMap<>();
		List<Integer> removeList = null;
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "wanote";		
/*		
		if(dto.getUpload() != null) {
			List<WanoteFileDTO> flist = mypageService.readWanoteFile(dto.getWaNum());
			if(flist != null) {
				for(WanoteFileDTO fdto : flist) {
					for(int i=0; i<dto.getUpload().size(); i++) {
						if(fdto.getOriginalFilename().equals(dto.getUpload().get(i).getOriginalFilename())){
							//파일 있으면 getUpload 리스트에서 제거
							removeList.add(i);
						}
					}
				}	
			}
		}
		
		//삭제
		if(removeList != null) {
			for(int i : removeList) {
				dto.getUpload().remove(i);
			}
		}
		*/
		WanoteFileDTO fdto = null;
		String saveFilename = null;
		
		for(MultipartFile mfile : dto.getUpload()) {
			if(mfile.isEmpty())
				continue;
			fdto = new WanoteFileDTO();
			fdto.setWaNum(dto.getWaNum());
			
			saveFilename = fileManager.doFileUpload(mfile, pathname);
			if(saveFilename!=null){
				String originalFilename = mfile.getOriginalFilename();
				fdto.setOriginalFilename(originalFilename);
			}
			
			fdto.setSaveFilename(saveFilename);
			mypageService.insertWanoteFile(fdto);
		}

		mypageService.updateWanote(dto);
		
		return model;
		
	}
	
}
