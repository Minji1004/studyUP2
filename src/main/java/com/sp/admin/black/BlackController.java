package com.sp.admin.black;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.blackController")
public class BlackController {
	@RequestMapping(value="/admin/blacklist/list")
	public String blacklist() {
		return ".admin.blacklist.list";
	}
}
