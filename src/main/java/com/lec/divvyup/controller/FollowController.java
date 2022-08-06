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
@RequestMapping(value="follow")
public class FollowController {
	@Autowired
	private FollowService followService;
	
	@RequestMapping(value="followMember", method=RequestMethod.GET)
	public String followMember(Model model, HttpSession session, Follow follow) {
		model.addAttribute("followResult", followService.followMember(session, follow));
		return "forward:../main/mainto.do";
	}
	
	@RequestMapping(value="unfollowMember", method=RequestMethod.GET)
	public String unfollowMember(Model model, HttpSession session, Follow follow) {
		model.addAttribute("unfollowResult", followService.unfollowMember(session, follow));
		return "forward:../main/mainto.do";
	}
}
