package com.lec.divvyup.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.FollowService;
import com.lec.divvyup.vo.Follow;

@Controller

@RequestMapping(value="main")
public class MainController {
	@Autowired
	private FollowService followService;
	
	@RequestMapping(value="mainto", method= {RequestMethod.GET, RequestMethod.POST})
	public String mainView(Model model, HttpSession session) {
		model.addAttribute("myFollowingList", followService.myFollowingList(session));
		model.addAttribute("myFollowerList", followService.myFollowerList(session));
		return "main/main";
	}
	
	@RequestMapping(value="unieTestMain", method= {RequestMethod.GET, RequestMethod.POST})
	public String unieTestMain() {
		return "main/unieTestMain";
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../member/loginForm.do";
	}
}
