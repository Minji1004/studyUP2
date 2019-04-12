package com.sp.faq;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("faq.faqController")
public class FaqController {
	@RequestMapping(value="/faq/faq")
	public String faq(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.menu4.faq.faq";
	}
}
