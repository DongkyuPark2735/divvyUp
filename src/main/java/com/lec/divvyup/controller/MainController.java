package com.lec.divvyup.controller;

<<<<<<< HEAD
=======

>>>>>>> babeadf72e944c959f5ccb566d2ecbc1c2b1cb4b
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
import com.lec.divvyup.service.GroupsService;
import com.lec.divvyup.service.MemberService;
<<<<<<< HEAD
<<<<<<< HEAD
import com.lec.divvyup.service.NotificationHistoryServiceImpl;
=======
=======

import com.lec.divvyup.vo.GroupDetail;
import com.lec.divvyup.vo.Member;

=======
>>>>>>> babeadf72e944c959f5ccb566d2ecbc1c2b1cb4b
>>>>>>> 6bb5051dbb697d01cc69bf8061d978f3b60069f3
import com.lec.divvyup.service.NotificationHistoryService;
>>>>>>> babeadf72e944c959f5ccb566d2ecbc1c2b1cb4b
import com.lec.divvyup.vo.Member;
import com.lec.divvyup.vo.NotificationHistory;

@Controller
<<<<<<< HEAD
@RequestMapping(value="main")
=======

@RequestMapping(value = "main")
>>>>>>> 6bb5051dbb697d01cc69bf8061d978f3b60069f3
public class MainController {
	@Autowired
	private FollowService followService;

	@Autowired
	private MemberService memberService;
<<<<<<< HEAD

	@Autowired
=======
	
<<<<<<< HEAD
<<<<<<< HEAD
	@Autowired
	private NotificationHistoryServiceImpl notificationHistoryService;
=======
=======
>>>>>>> babeadf72e944c959f5ccb566d2ecbc1c2b1cb4b
>>>>>>> 6bb5051dbb697d01cc69bf8061d978f3b60069f3
	private NotificationHistoryService notificationHistoryService;
>>>>>>> babeadf72e944c959f5ccb566d2ecbc1c2b1cb4b

	@Autowired
	ServletContext application;

<<<<<<< HEAD
	@Autowired
	private GroupsService groupsService;
	
	@RequestMapping(value="mainto", method= {RequestMethod.GET, RequestMethod.POST})
	public String mainView(Member member, Model model, HttpSession session,
			NotificationHistory notificationHistory/* , String mid */) {
		model.addAttribute("myFollowingList", followService.myFollowingList(session));
		model.addAttribute("myFollowerList", followService.myFollowerList(session));
		model.addAttribute("uncheckdNotificationCnt", notificationHistoryService.getUncheckdNotificationCnt(session, notificationHistory));
		 model.addAttribute("groupList", groupsService.groupList(member.getMid()));
		 model.addAttribute("followList", groupsService.followList(member.getMid()));
		
=======
	@RequestMapping(value = "mainto", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainView(Member member, Model model, HttpSession session, NotificationHistory notificationHistory) {
		model.addAttribute("myFollowingList", followService.myFollowingList(session));
		model.addAttribute("myFollowerList", followService.myFollowerList(session));
		model.addAttribute("uncheckdNotificationCnt",
		notificationHistoryService.getUncheckdNotificationCnt(session, notificationHistory));
>>>>>>> 6bb5051dbb697d01cc69bf8061d978f3b60069f3
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
<<<<<<< HEAD

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

=======
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		application.removeAttribute((String)session.getAttribute("mid"));
		Enumeration<String> appMlists = application.getAttributeNames();
		
		ArrayList<Member> mList = (ArrayList<Member>) memberService.memberListForGroupBoard();
		
		ArrayList<String> tempMlist = new ArrayList<String>();

		while(appMlists.hasMoreElements()){
			String appMid = appMlists.nextElement();
			Object attrValue = application.getAttribute(appMid);
			for(Member ml : mList) {
				if(ml.getMid().equals(attrValue)) {
					tempMlist.add(ml.getMid());
				}
			}
		}
		
		application.setAttribute("sessionMList", tempMlist);
<<<<<<< HEAD
<<<<<<< HEAD
		/* application.removeAttribute((String) session.getAttribute("mid")); */
=======
=======
>>>>>>> 6bb5051dbb697d01cc69bf8061d978f3b60069f3
>>>>>>> babeadf72e944c959f5ccb566d2ecbc1c2b1cb4b
		session.invalidate();
		return "redirect:../member/loginForm.do";
	}
}
