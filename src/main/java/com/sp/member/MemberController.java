package com.sp.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("member.memberController")
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping(value = "/member/login", method=RequestMethod.GET)
	public String loginForm() {		 
		return "member/login";
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginSubmit(
			@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession session,
			Model model
			) {
		List<Member>mList =service.loginMember(userId);
		List<Integer> list = new ArrayList<>();
 		if(mList.size() == 0 ||  !mList.get(0).getUserPwd().equals(userPwd)) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return "member/login";
		}
		
		//isAdmin "0" 일 때: 일반 사용자 , 1일 때 : 관리자
		//getBlicenseKindNum == 1 일 때  : 스터디룸 사장님, getBlicenseKindNum == 2 일 때 : 강사
		//sessionInfo userType 에서 0:사용자, 1:관리자, 2:스터디룸 사장님, 3:강사
		
		SessionInfo info=new SessionInfo();
		info.setUserName(mList.get(0).getNickname());
		info.setUserId(mList.get(0).getUserId());
		info.setTel(mList.get(0).getTel());
		info.setUserNum(mList.get(0).getUserNum());
		
		if(mList.get(0).getIsAdmin().equals("0")) list.add(0);	//사용자
		if(mList.get(0).getIsAdmin().equals("1")) list.add(1);	//관리자			
		
		
		session.setMaxInactiveInterval(30*60); // 세션유지시간 30분, 기본:30분
		session.setAttribute("member", info);
		
		List<Integer> bLicenseNumList = new ArrayList<>();
		
		for(Member dto : mList) {
			//스터디룸 사장님
			if(dto.getBlicenseKindNum()==1) { 	
				list.add(2); 
				bLicenseNumList.add(dto.getBlicenseNum());
			}	
			//강사
			if(dto.getBlicenseKindNum()==2) {
				list.add(3);	
				bLicenseNumList.add(dto.getBlicenseNum());
			}
		}
		
		info.setBlicenseNum(bLicenseNumList);
		info.setUserType(list);	

		String uri = (String)session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		
		if(uri == null)
			uri = "redirect:/main";
		else
			uri = "redirect:" + uri;
		
		if(info.getUserType().get(0)==1){
			return "redirect:/admin";
		}
		return uri;
	}
	
	@RequestMapping(value="/member/member", method=RequestMethod.GET)
	public String memberForm(Model model) {
		model.addAttribute("mode", "created");
		return "member/member";
	}
	
	@RequestMapping(value="/member/member", method=RequestMethod.POST)
	public String memberSubmit(Member dto,
			Model model) {

		int result=service.insertMember(dto);
		if(result==1) {
			StringBuffer sb=new StringBuffer();
			sb.append(dto.getNickname() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
			
			model.addAttribute("message", sb.toString());
			model.addAttribute("title", "회원 가입");
			
			return ".member.complete";
		} 
		
		model.addAttribute("mode", "created");
		model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
			
		return ".member.member";
	}
	
	
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("member");
		
		session.invalidate();
		
		return "redirect:/";
	}

	
	
}
