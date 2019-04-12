package com.sp.guest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("guest.guestController")
public class GuestController {
	@RequestMapping(value="/guest/guest")
	public String guest(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.menu2.guest.guest";
	}
}
