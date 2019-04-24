package com.sp.mypage;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.member.Member;
import com.sp.member.MemberService;

@Controller("mypage.myPageController")
public class MyPageController {
	@Autowired
	private MemberService memberService;
	
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
	public String mypageUpdate(
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
}
