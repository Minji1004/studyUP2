package com.sp.company;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("company.companyController")
public class CompanyController {
	@RequestMapping(value="/company/info")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.menu1.company.info";
	}
	
	@RequestMapping(value="/company/history")
	public ModelAndView history() throws Exception {
		ModelAndView mav=new ModelAndView(".four.menu1.company.history");
		mav.addObject("subMenu", "2");
		return mav;
	}
}
