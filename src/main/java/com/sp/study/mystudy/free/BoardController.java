package com.sp.study.mystudy.free;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
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
import com.sp.study.Study;
import com.sp.study.StudyService;

@Controller("study.boardController")
public class BoardController {
	@Autowired
	private StudyService study;
	@Autowired
	private BoardService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;

	@RequestMapping(value = "/study/free/list")
	public String main(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition, 
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req, @RequestParam int studyNum, 
			@RequestParam(defaultValue = "2") int left, Model model) throws Exception {

		String cp = req.getContextPath();

		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page)
			current_page = total_page;

		// 리스트에 출력할 데이터를 가져오기
		int start = (current_page - 1) * rows;
		if (start < 0)
			start = 0;
		map.put("start", start);
		map.put("rows", rows);

		// 글 리스트
		List<Board> list = service.listBoard(map);

		// 리스트의 번호
		int listNum, n = 0;
		for (Board dto : list) {
			listNum = dataCount - (start + n);
			dto.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/study/free/list";
		String articleUrl = cp + "/study/free/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8")
			+"&studyNum="+studyNum+"&left="+left;
		}

		if (query.length() != 0) {
			listUrl = cp + "/study/free/list?" + query+"&studyNum="+studyNum+"&left="+left;
			articleUrl = cp + "/study/free/article?page=" + current_page + "&" + query+"&studyNum="+studyNum+"&left="+left;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		Study dto = study.readStudy(studyNum);

		model.addAttribute("dto", dto);
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".study.free.list";
	}

	@RequestMapping(value = "/study/free/created", method = RequestMethod.GET)
	public String createdForm(
			@RequestParam int studyNum, 
			@RequestParam(defaultValue = "2") int left, 
			Model model) throws Exception {

		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		model.addAttribute("mode", "created");

		return ".study.free.created";
	}

	@RequestMapping(value = "/study/free/created", method = RequestMethod.POST)
	public String createdSubmit(
			Board dto, 
			HttpSession session,
			@RequestParam int studyNum, 
			@RequestParam(defaultValue = "2") int left) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "sfree";

		dto.setUserId(info.getUserId());
		service.insertBoard(dto, pathname);

		return "redirect:/study/free/list"+"?studyNum="+studyNum+"&left="+left;
	}

	@RequestMapping(value = "/study/free/download")
	public void download(
			@RequestParam int studyNum, 
			HttpServletResponse resp, 
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "sfree";
		Board dto = service.readBoard(studyNum);
		boolean flag = false;

		if (dto != null) {
			flag = fileManager.doFileDownload(dto.getSaveFilename(), dto.getOriginalFilename(), pathname, resp);
		}

		if (!flag) {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('파일 다운로드가 실패했습니다.');history.back();</script>");
		}
	}

	@RequestMapping(value = "/study/free/article")
	public String article(
			@RequestParam int studyNum, 
			@RequestParam(defaultValue = "2") int left, 
			@RequestParam int sFreeNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword, 
			Model model) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page+"&studyNum="+studyNum+"&left="+left;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		// 조회수 증가
		service.updateHitCount(sFreeNum);

		// 해당 레코드 가져 오기
		Board dto = service.readBoard(sFreeNum);
		if (dto == null)
			return "redirect:/study/free/list?" + query + "&studyNum="+studyNum+"&left="+left;

		// 스마트에디터를 사용하므로 엔터를 <br>로 변경하지 않음
		// dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("sFreeNum", sFreeNum);

		Board preReadDto = service.preReadBoard(map);
		Board nextReadDto = service.nextReadBoard(map);

		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		model.addAttribute("page", page);
		model.addAttribute("query", query);

		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);

		return ".study.free.article";
	}

	@RequestMapping(value = "/study/free/update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int studyNum, 
			@RequestParam(defaultValue = "2") int left,
			@RequestParam int sFreeNum, 
			@RequestParam String page,
			HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Board dto = service.readBoard(sFreeNum);
		if (dto == null) {
			return "redirect:/study/free/list?page=" + page + "&studyNum="+studyNum+"&left="+left;
		}

		if (!info.getUserId().equals(dto.getUserId())) {
			return "redirect:/study/free/list?page=" + page +"&studyNum="+studyNum+"&left="+left;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);

		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);

		return ".study.free.created";
	}

	@RequestMapping(value = "/study/free/update", method = RequestMethod.POST)
	public String updateSubmit(
			@RequestParam int studyNum, 
			@RequestParam(defaultValue = "2") int left, 
			Board dto,
			@RequestParam String page, 
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "sfree";

		// 수정 하기
		service.updateBoard(dto, pathname);

		return "redirect:/study/free/list?page=" + page +"&studyNum="+studyNum+"&left="+left;
	}

	@RequestMapping(value = "/study/free/deleteFile", method = RequestMethod.GET)
	public String deleteFile(
			@RequestParam int studyNum, 
			@RequestParam(defaultValue = "2") int left,
			@RequestParam int sFreeNum, 
			@RequestParam String page, 
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Board dto = service.readBoard(sFreeNum);
		if (dto == null) {
			return "redirect:/study/free/list?page=" + page +"&studyNum="+studyNum+"&left="+left;
		}

		if (!info.getUserId().equals(dto.getUserId())) {
			return "redirect:/study/free/list?page=" + page +"&studyNum="+studyNum+"&left="+left;
		}

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "sfree";
		if (dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);

			dto.setSaveFilename("");
			dto.setOriginalFilename("");
			service.updateBoard(dto, pathname);
		}

		return "redirect:/study/free/update?num=" + sFreeNum + "&page=" + page +"&studyNum="+studyNum+"&left="+left;
	}

	@RequestMapping(value = "/study/free/delete")
	public String delete(
			@RequestParam int studyNum, 
			@RequestParam(defaultValue = "2") int left,
			@RequestParam int sFreeNum, 
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition, 
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		// 해당 레코드 가져 오기
		Board dto = service.readBoard(sFreeNum);
		if (dto == null) {
			return "redirect:/study/free/list?" + query + "&studyNum="+studyNum+"&left="+left;
		}

		if (!info.getUserId().equals(dto.getUserId()) && !info.getUserId().equals("admin")) {
			return "redirect:/study/free/list?" + query;
		}

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "sfree";

		service.deleteBoard(sFreeNum, dto.getSaveFilename(), pathname);

		return "redirect:/study/free/list?" + query + "&studyNum="+studyNum+"&left="+left;
	}

	// 댓글 리스트
	@RequestMapping(value = "/study/free/listReply")
	public String listReply(
			@RequestParam int studyNum, 
			@RequestParam(defaultValue = "2") int left,
			@RequestParam int sFreeNum, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sFreeNum", sFreeNum);

		dataCount = service.replyCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page)
			current_page = total_page;

		// 리스트에 출력할 데이터
		int start = (current_page - 1) * rows;
		if (start < 0)
			start = 0;
		map.put("start", start);
		map.put("rows", rows);
		List<Reply> listReply = service.listReply(map);

		// 엔터를 <br>
		Iterator<Reply> it = listReply.iterator();
		int listNum, n = 0;
		while (it.hasNext()) {
			Reply dto = it.next();
			listNum = dataCount - (start + n);
			dto.setListNum(listNum);
			dto.setSfrContent(dto.getSfrContent().replaceAll("\n", "<br>"));
			n++;
		}

		// AJAX 페이징처리
		String paging = myUtil.paging(current_page, total_page);

		// jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "study/free/listReply" +"?studyNum="+studyNum+"&left="+left;
	}

	// 댓글 및 리플별 답글 추가
	@RequestMapping(value = "/study/free/insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto, 
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "true";
		dto.setUserId(info.getUserId());
		int result = service.insertReply(dto);
		if (result == 0)
			state = "false";

		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	// 댓글 및 댓글별답글 삭제
	@RequestMapping(value = "/study/free/deleteReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam int replyNum, 
			@RequestParam String mode, 
			HttpSession session)
			throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "true";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mode", mode);
		map.put("replyNum", replyNum);
		map.put("userId", info.getUserId());

		// 좋아요/싫어요 는 ON DELETE CASCADE 로 자동 삭제

		// 댓글삭제
		int result = service.deleteReply(map);

		if (result == 0)
			state = "false";

		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

}
