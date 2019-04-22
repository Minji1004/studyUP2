package com.sp.customer.faq;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("faq.faqController")
public class FaqController {
	@RequestMapping(value="/customer/faq/faq")
	public String list(Model model) throws Exception {
		model.addAttribute("subMenu", "3");
		return ".customer.faq.list";
	}
}
