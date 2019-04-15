package com.sp.customer.inquiry;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// inquiry : 1:1 게시판
@Controller("customer.inquiryController")
public class InquiryController {
	
	@RequestMapping(value="/customer/inquiry/list")
	public String list(
			Model model) throws Exception {
		
		model.addAttribute("subMenu", "2");
		return ".customer.inquiry.list";
	}

}
