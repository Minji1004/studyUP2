package com.sp.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.adminController")
public class AdminController {
	 
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String method() {
		return ".adminLayout";
	}
}
