package com.lec.divvyup.controller;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.FollowService;
import com.lec.divvyup.service.MemberService;

import com.lec.divvyup.vo.GroupDetail;
import com.lec.divvyup.vo.Member;

import com.lec.divvyup.service.NotificationHistoryService;
import com.lec.divvyup.vo.Follow;
import com.lec.divvyup.vo.Member;
import com.lec.divvyup.vo.NotificationHistory;

@Controller

@RequestMapping(value = "main")
public class MainController {
	@Autowired
	private FollowService followService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private NotificationHistoryService notificationHistoryService;

	@Autowired
	ServletContext application;

	@RequestMapping(value = "mainto", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainView(Member member, Model model, HttpSession session, NotificationHistory notificationHistory) {
		model.addAttribute("myFollowingList", followService.myFollowingList(session));
		model.addAttribute("myFollowerList", followService.myFollowerList(session));
		model.addAttribute("uncheckdNotificationCnt",
		notificationHistoryService.getUncheckdNotificationCnt(session, notificationHistory));
		return "main/main";
	}

	@RequestMapping(value = "mainforAdmin", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainViewForAdmin(Member member, Model model, HttpSession session,
			NotificationHistory notificationHistory) {
		model.addAttribute("myFollowingList", followService.myFollowingList(session));
		model.addAttribute("myFollowerList", followService.myFollowerList(session));
//		model.addAttribute("uncheckdNotificationCnt", notificationHistoryService.getUncheckdNotificationCnt(session, notificationHistory));
		return "main/main";
	}

	@RequestMapping(value = "unieTestMain", method = { RequestMethod.GET, RequestMethod.POST })
	public String unieTestMain() {
		return "main/unieTestMain";
	}

	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {

		/*
		 * application.removeAttribute((String)session.getAttribute("mid"));
		 * Enumeration<String> appMlists = application.getAttributeNames();
		 * 
		 * ArrayList<Member> mList = (ArrayList<Member>)
		 * memberService.memberListForGroupBoard();
		 * 
		 * ArrayList<String> tempMlist = new ArrayList<String>();
		 * 
		 * while(appMlists.hasMoreElements()){ String appMid = appMlists.nextElement();
		 * Object attrValue = application.getAttribute(appMid); for(Member ml : mList) {
		 * if(ml.getMid().equals(attrValue)) { tempMlist.add(ml.getMid()); } } }
		 * 
		 * application.setAttribute("sessionMList", tempMlist);
		 * 
		 * application.removeAttribute((String) session.getAttribute("mid"));
		 */

		session.invalidate();
		return "redirect:../member/loginForm.do";
	}
}
