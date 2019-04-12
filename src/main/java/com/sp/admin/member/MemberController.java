package com.sp.admin.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.memberController")
public class MemberController {
	
	@RequestMapping(value="/admin/member/list")
	public String memberController() {
		return ".admin.member.list";
	}
}
