package com.sp.community.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("faq.FaqController")
public class FaqController {
	
	@RequestMapping(value="/customer/faq/main")
	public String main() {
		return "customer/faq/main";
	}
}
