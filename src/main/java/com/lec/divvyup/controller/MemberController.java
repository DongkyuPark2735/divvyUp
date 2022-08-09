package com.lec.divvyup.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.FollowService;
import com.lec.divvyup.service.MemberService;
import com.lec.divvyup.vo.Member;

@Controller
@RequestMapping(value="member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FollowService followService;
	
	@RequestMapping(value="loginForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String loginForm() {
		return "member/loginForm";
	}
	
	
	@RequestMapping(value="joinForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
		return "member/joinForm";
	}
	
	@RequestMapping(value="confirmMid", method=RequestMethod.GET)
	public String confirmMid(String mid, Model model) {
//		if(result == 1) {
			model.addAttribute("midConfirmResult", memberService.confirmMid(mid));
//		}else if(result == 0) {
//			model.addAttribute("midConfirmResult", result);
//		}
		return "member/confirmMid";
	}
	
	@RequestMapping(value="confirmMemail", method=RequestMethod.GET)
	public String confirmMemail(String memail, Model model) {
		model.addAttribute("memailConfirmResult", memberService.confirmMemail(memail));
		return "member/confirmMemail";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Member member, Model model, HttpSession session) {
		int result = memberService.joinMember(member, session);
		if(result == 1) {
			model.addAttribute("joinResult", "회원가입 성공");
		}else if(result == 0) {
			model.addAttribute("joinResult", "회원가입 실패");
		}
		return "forward:loginForm.do";
	}
	
	@RequestMapping(value="modifyMemberForm", method=RequestMethod.GET)
	public String modifyMemberForm(String mid, Model model) {
		model.addAttribute("member", memberService.getMember(mid));
		return "member/modifyMemberForm";
	}
	
	@RequestMapping(value="modifyMember", method=RequestMethod.POST)
	public String modifyMember(Member member, Model model, HttpSession session) {
		model.addAttribute("modifyMemberResult", memberService.modifyMember(member));
		session.setAttribute("member", member);
		return "forward:../mainto.do";
	}
	
	@RequestMapping(value="searchMemberList", method=RequestMethod.GET)
	public String searchMemberList(Member member, HttpSession session, Model model) {
		model.addAttribute("searchedMemberList", memberService.searchMember(session, member));
		model.addAttribute("FollowingList", followService.myFollowingList(session));
		model.addAttribute("schItem", member);
		return "forward:../main/mainto.do";
	}
	
	@RequestMapping(value="searchIdPwForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchIdPwForm() {
		return "member/searchIdPwForm";
	}
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(String mid, String mpw, Model model, HttpSession session) {
		String result = memberService.loginCheck(mid, mpw, session);
		if(result.equals("로그인 성공")) {
			return "redirect:../main/mainto.do";
		}else {
			model.addAttribute("mid", mid);
			model.addAttribute("mpw", mpw);
			model.addAttribute("result", result);
			return "forward:loginForm.do";
		}
	}
	
	@RequestMapping(value="searchMid", method=RequestMethod.POST)
	public String searchMid(String mname, String memail, Model model) {
		String result = memberService.searchMid(mname, memail);
		if(result.equals("아이디를 해당 메일로 보냈습니다")) {
			model.addAttribute("searchMidResult",result);
			return "forward:loginForm.do";
		}else {
			model.addAttribute("mid", mname);
			model.addAttribute("mpw", memail);
			model.addAttribute("result", result);
			return "forward:searchIdPwForm.do";
		}
	}
	
	@RequestMapping(value="searchMpw", method=RequestMethod.POST)
	public String searchMpw(String mid, String mname, String memail, Model model) {
		String result = memberService.searchMpw(mid, mname, memail);
		if(result.equals("비밀번호를 해당 메일로 보냈습니다")) {
			model.addAttribute("searchMpwResult",result);
			return "forward:loginForm.do";
		}else {
			model.addAttribute("mid", mid);
			model.addAttribute("mname", mname);
			model.addAttribute("memail", memail);
			model.addAttribute("result", result);
			return "forward:searchIdPwForm.do";
		}
	}
}
