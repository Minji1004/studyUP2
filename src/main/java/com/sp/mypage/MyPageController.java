package com.sp.mypage;

import java.io.File;
import java.util.HashMap;
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

import com.sp.common.FileManager;
import com.sp.member.Member;
import com.sp.member.MemberService;

@Controller("mypage.myPageController")
public class MyPageController {
	@Autowired
	private MemberService memberService;
	@Autowired	
	private FileManager fileManager;
	@Autowired	
	private MypageService mypageService;
	
	@RequestMapping(value="/mypage/info")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.menu5.mypage.info";
	}
	
	@RequestMapping(value = "/mypage/main")
	public String main(Model model) throws Exception{
		
		return ".four.mypage.main";
	}
	
	@RequestMapping(value = "/mypage/basket/main")
	public String basket() throws Exception{
		return "mypage/basket/main";
	}
	
	@RequestMapping(value = "/mypage/reservation/study/main")
	public String study() throws Exception{
		return "mypage/reservation/study/main";
	}
	
	@RequestMapping(value = "/mypage/reservation/studyroom/main")
	public String studyroom() throws Exception{
		return "mypage/reservation/studyroom/main";
	}
	
	@RequestMapping(value = "/mypage/schedule/main")
	public String schedule() throws Exception{
		return "mypage/schedule/main";
	}
	
	@RequestMapping(value = "/mypage/wanote/main")
	public String wanote() throws Exception{
		return "mypage/wanote/main";
	}

	@RequestMapping(value = "/mypage/mypage")
	public String mypage(
			@RequestParam String userId,
			HttpSession session,
			Model model) {

		Member dto =  memberService.readMember(userId);
		

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "member_profile";
		
		if(dto.getPicture() != null) {
			File f= new File(pathname + File.separator + dto.getPicture());
		}
		
		model.addAttribute("dto", dto);

		return "mypage/mypage";
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
			File f= new File(pathname + File.separator + dto.getPicture());
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
		String url = null;
		String cp = req.getContextPath();
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
	
	@RequestMapping(value = "/mypage/wanote/create", method = RequestMethod.GET)
	public String wanoteCreatedForm(Model model) {
		
		model.addAttribute("mode", "created");
		
		return "/mypage/wanote/create";
	}
	
	@RequestMapping(value = "/mypage/wanote/create", method = RequestMethod.POST)
	public String wanoteCreatedSubmit(
			WanoteDTO dto
			,Model model) {
		

		return "/mypage/wanote/create";
	}
}
