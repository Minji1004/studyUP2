package com.sp.community.freeBoard;

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

@Controller("freBoard.FreBoardController")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService service;

	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("/community/freeBoard/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model	) throws Exception {
		
		int rows = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start=(current_page-1)*rows;
		if(start<0) start=0;
		
		map.put("start", start);
		map.put("rows", rows);

		List<FreeBoard> list = service.listFreeBoard(map);

		// 글번호 만들기
		int listNum, n = 0;
		Iterator<FreeBoard> it = list.iterator();
		while (it.hasNext()) {
			FreeBoard data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

        // ajax 페이징처리
        String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "community/freeBoard/list";
	}

	@RequestMapping(value="/community/freeBoard/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {

		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		return "community/freeBoard/created";
	}

	@RequestMapping(value="/community/freeBoard/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			FreeBoard dto,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		dto.setUserId(info.getUserId());
		service.insertFreeBoard(dto, "created");
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value="/community/freeBoard/article")
	public String article(
			@RequestParam int freePostNum,
			@RequestParam String pageNo,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model	) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		service.updateHitCount(freePostNum);
		
		FreeBoard dto = service.readFreeBoard(freePostNum);
		if(dto==null) {
			return "community/error";
		}
		
        dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
         
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("groupNum", dto.getGroupNum());
		map.put("orderNo", dto.getOrderNo());

		FreeBoard preReadDto = service.preReadFreeBoard(map);
		FreeBoard nextReadDto = service.nextReadFreeBoard(map);

		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("pageNo", pageNo);
		
		return "community/freeBoard/article";
	}
	
	
	@RequestMapping(value="/community/freeBoard/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int freePostNum,
			@RequestParam String pageNo,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		FreeBoard dto = service.readFreeBoard(freePostNum);
		if(dto==null) {
			return "community/error";
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			return "community/error";
		}
		
		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);		

		return "community/freeBoard/created";
	}

	@RequestMapping(value="/community/freeBoard/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			FreeBoard dto,
			HttpSession session) throws Exception {

		String state="true";		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		service.updateFreeBoard(dto);

		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value="/community/freeBoard/reply", method=RequestMethod.GET)
	public String replyForm(
			@RequestParam int freePostNum,
			@RequestParam String pageNo,
			HttpSession session,			
			Model model) throws Exception {
		
/*		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info.getUserType().get(0)!=1) {
			return "community/error";
		}
*/
		
		FreeBoard dto = service.readFreeBoard(freePostNum);
		if(dto==null) {
			return "community/error";
		}
		
		String str = "["+dto.getSubject()+"] 에 대한 답변입니다.\n";
		dto.setContent(str);
		
		model.addAttribute("dto", dto);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("mode", "reply");

		return "community/freeBoard/created";
	}

	@RequestMapping(value="/community/freeBoard/reply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replySubmit(
			FreeBoard dto,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		dto.setUserId(info.getUserId());
		service.insertFreeBoard(dto, "reply");
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/community/freeBoard/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int freePostNum,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		FreeBoard dto = service.readFreeBoard(freePostNum);
		if(dto!=null) {
			if(info.getUserType().get(0)==1 || info.getUserId().equals(dto.getUserId())) {
				service.deleteFreeBoard(freePostNum);
				state="true";
			}
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}

}
