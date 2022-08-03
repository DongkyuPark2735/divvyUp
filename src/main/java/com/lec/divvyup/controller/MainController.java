package com.lec.divvyup.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="main")
public class MainController {
	@RequestMapping(value="main", method= {RequestMethod.GET, RequestMethod.POST})
	public String mainView() {
		return "main/main";
	}
	@RequestMapping(value="unieTestMain", method= {RequestMethod.GET, RequestMethod.POST})
	public String unieTestMain() {
		return "main/unieTestMain";
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:member/loginForm.do";
	}
	

}
