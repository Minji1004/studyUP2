package com.sp.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("community.CommunityController")
public class CommunityController {
	
	@RequestMapping(value="/community/main")
	public String main() {
		return ".community.main";
	}
}
