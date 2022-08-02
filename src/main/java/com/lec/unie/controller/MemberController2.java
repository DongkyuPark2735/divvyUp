package com.lec.unie.controller;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.unie.dto.Member2;
import com.lec.unie.service.MemberService2;

@Controller
@RequestMapping(value="member2")
public class MemberController2 {
	@Autowired
	private MemberService2 memberService2;
	@RequestMapping(params = "method=joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/joinForm";
	}
	@RequestMapping(params = "method=idConfirm", method = RequestMethod.GET)
	public String idConfirm(String mid, Model model) {
		model.addAttribute("idConfirmResult", memberService2.idConfirm(mid));
		return "member/idConfirm";
	}
	@RequestMapping(params = "method=join", method = RequestMethod.POST)
	public String join(@ModelAttribute("mDto") Member2 member, HttpSession httpSession, Model model) {
		model.addAttribute("joinResult", memberService2.joinMember(member, httpSession));
		return "forward:member.do?method=loginForm";
	}
	@RequestMapping(params = "method=loginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm() {
		return "member/loginForm";
	}
	@RequestMapping(params="method=login", method = RequestMethod.POST)
	public String login(String mid, String mpw, HttpSession httpSession, Model model) {
		String result = memberService2.loginCheck(mid, mpw, httpSession);
		if(result.equals("로그인 성공")) {
			return "redirect:main.do";
		} else {
			model.addAttribute("mid", mid);
			model.addAttribute("mpw", mpw);
			model.addAttribute("loginResult", result);
			return "forward:member.do?method=loginForm";
		}
	}
	@RequestMapping(params="method=modifyForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String modifyForm() {
		return "member/modifyForm";
	}
	@RequestMapping(params="method=modify", method=RequestMethod.POST)
	public String modify(@ModelAttribute("mDto") Member2 member, HttpSession httpSession, Model model) {
		model.addAttribute("modifyResult", memberService2.modifyMember(member));
		httpSession.setAttribute("member", member); //to update info on session as well 
		return "forward:main.do";
	
	}
	@RequestMapping(params="method=logout")
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:main.do";
	}
}