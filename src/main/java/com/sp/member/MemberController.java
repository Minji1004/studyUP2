package com.sp.member;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.FileManager;

@Controller("member.memberController")
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private FileManager fileManager;

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
 		if(mList.size() == 0 || !mList.get(0).getUserPwd().equals(userPwd)) {
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
	public String memberSubmit(
			Member dto,
			HttpSession session,
			Model model) throws Exception {

		String root =  session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "member_profile";
		
		String saveFilename = fileManager.doFileUpload(dto.getPictureM(), pathname);
		if(saveFilename!=null) {
			dto.setPicture(saveFilename);
		}
	
		int result = service.insertMember(dto);
		
		StringBuffer sb=new StringBuffer();
		if(result == 0) {
			sb.append("회원 가입이 실패했습니다.<br> 다시 회원 가입 해주십시오");
		}else {
			sb.append(dto.getNickname() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
		}

		model.addAttribute("message", sb.toString());
		
		return "redirect:/member/login";
	}
	
	
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("member");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/member/userIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> userIdCheck(@RequestParam String userId){
		
		Map<String, Object> model = new HashMap<>();
		String state = "true";
		int result = service.confirmUserId(userId);
		if(result > 0) {
			state = "false";
		}
		
		model.put("state", state);
		
		return model;
	}

	@RequestMapping(value="/member/certifyEmail", method = RequestMethod.GET)
	public String certifyEmail() {
		return "mail/send";
	}

	@RequestMapping(value="/member/kakaoLogin")
	public String kakaoLogin(
			@RequestParam String userId,
			@RequestParam String nickname,
			HttpSession session,
			Model model) {
		
		Member dto = new Member();
		dto.setUserId(userId);
		dto.setNickname(nickname);
		
		int result = service.confirmUserId(userId);
		
		if(result==0) {
			service.insertMember(dto);	
		}
		
		List<Member>mList =service.loginMember(userId);
		List<Integer> list = new ArrayList<>();
		

		
		
			
		SessionInfo info=new SessionInfo();
		info.setUserId(userId);
		info.setUserName(nickname);
		session.setMaxInactiveInterval(30*60); // 세션유지시간 30분, 기본:30분
		session.setAttribute("member", info);
	
		if(mList.get(0).getIsAdmin().equals("0")) list.add(0);	//사용자
		if(mList.get(0).getIsAdmin().equals("1")) list.add(1);	//관리자		
		
		List<Integer> bLicenseNumList = new ArrayList<>();
		
		for(Member member : mList) {
			//스터디룸 사장님
			if(member.getBlicenseKindNum()==1) { 	
				list.add(2); 
				bLicenseNumList.add(dto.getBlicenseNum());
			}	
			//강사
			if(member.getBlicenseKindNum()==2) {
				list.add(3);	
				bLicenseNumList.add(dto.getBlicenseNum());
			}
		}
		
		info.setBlicenseNum(bLicenseNumList);
		info.setUserType(list);	
		
		return "redirect:/";	
	}
	
}
