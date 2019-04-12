package com.sp.bbs;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("bbs.boardController")
public class BoardController {
	@RequestMapping(value="/bbs/list")
	public String list(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		return ".four.menu2.bbs.list";
	}
}

