package com.lec.divvyup.controller;

<<<<<<< HEAD
=======

>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
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
import com.lec.divvyup.service.NotificationHistoryServiceImpl;
<<<<<<< HEAD
=======
<<<<<<< HEAD
import com.lec.divvyup.util.Paging;
=======
<<<<<<< HEAD
import com.lec.divvyup.util.Paging;
import com.lec.divvyup.vo.Admin;
=======

>>>>>>> 6046d284dcb394365a7690681b38d38763173063
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
import com.lec.divvyup.vo.GroupDetail;
import com.lec.divvyup.vo.Member;
import com.lec.divvyup.service.NotificationHistoryService;
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
import com.lec.divvyup.vo.Member;
import com.lec.divvyup.vo.NotificationHistory;

@Controller
<<<<<<< HEAD
@RequestMapping(value = "main")
=======
<<<<<<< HEAD

@RequestMapping(value = "main")

=======
@RequestMapping(value = "main")
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
public class MainController {
	@Autowired
	private FollowService followService;

	@Autowired
	private MemberService memberService;
<<<<<<< HEAD

	@Autowired
	private NotificationHistoryServiceImpl notificationHistoryService;
=======
<<<<<<< HEAD
	
	@Autowired
	private NotificationHistoryServiceImpl notificationHistoryService;
=======

	@Autowired
	private NotificationHistoryServiceImpl notificationHistoryService;

>>>>>>> 6046d284dcb394365a7690681b38d38763173063
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d

	@Autowired
	ServletContext application;

	@Autowired
	private GroupsService groupsService;

	@RequestMapping(value = "mainto", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainView(Member member, Model model, HttpSession session,
<<<<<<< HEAD
		NotificationHistory notificationHistory, String pageNum) {
		model.addAttribute("myFollowingList", followService.myFollowingList(session));
		model.addAttribute("myFollowerList", followService.myFollowerList(session));
		model.addAttribute("uncheckdNotificationCnt", notificationHistoryService.getUncheckdNotificationCnt(session, notificationHistory));
		String mid = (String)session.getAttribute("mid");
		
		
		
		model.addAttribute("groupList", groupsService.groupList(pageNum, mid));
		model.addAttribute("paging", new Paging(pageNum, groupsService.countGroups(mid)));
		
		
		
		model.addAttribute("followList", groupsService.followList(mid));
		member = memberService.getMember(mid);
		model.addAttribute("person", member);
		 return "main/main";
=======
<<<<<<< HEAD
			NotificationHistory notificationHistory, String pageNum) {
			model.addAttribute("myFollowingList", followService.myFollowingList(session));
			model.addAttribute("myFollowerList", followService.myFollowerList(session));
			model.addAttribute("uncheckdNotificationCnt", notificationHistoryService.getUncheckdNotificationCnt(session, notificationHistory));
			String mid = (String)session.getAttribute("mid");
			model.addAttribute("groupList", groupsService.groupList(pageNum, mid));
			model.addAttribute("paging", new Paging(pageNum, groupsService.countGroups(mid)));
			model.addAttribute("followList", groupsService.followList(mid));
			member = memberService.getMember(mid);
			model.addAttribute("person", member);
			return "main/main";
=======
			NotificationHistory notificationHistory/* , String mid */) {
		model.addAttribute("myFollowingList", followService.myFollowingList(session));
		model.addAttribute("myFollowerList", followService.myFollowerList(session));
<<<<<<< HEAD
		model.addAttribute("uncheckdNotificationCnt",
				notificationHistoryService.getUncheckdNotificationCnt(session, notificationHistory));
		model.addAttribute("groupList", groupsService.groupList(member.getMid()));
		model.addAttribute("followList", groupsService.followList(member.getMid()));
=======
		model.addAttribute("uncheckdNotificationCnt", notificationHistoryService.getUncheckdNotificationCnt(session, notificationHistory));
		 model.addAttribute("groupList", groupsService.groupList(member.getMid()));
		 model.addAttribute("followList", groupsService.followList(member.getMid()));
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
		return "main/main";
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
	}

	@RequestMapping(value = "mainforAdmin", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainViewForAdmin(Admin admin, Model model, HttpSession session,
			NotificationHistory notificationHistory) {
		model.addAttribute("myFollowingList", followService.myFollowingList(session));
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
		application.removeAttribute((String) session.getAttribute("mid"));
=======

<<<<<<< HEAD
=======

	
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		application.removeAttribute((String)session.getAttribute("mid"));
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
		Enumeration<String> appMlists = application.getAttributeNames();
		ArrayList<Member> mList = (ArrayList<Member>) memberService.memberListForGroupBoard();
		ArrayList<String> tempMlist = new ArrayList<String>();
		while (appMlists.hasMoreElements()) {
			String appMid = appMlists.nextElement();
			Object attrValue = application.getAttribute(appMid);
			for (Member ml : mList) {
				if (ml.getMid().equals(attrValue)) {
					tempMlist.add(ml.getMid());
				}
			}
		}
		application.setAttribute("sessionMList", tempMlist);
<<<<<<< HEAD
		application.removeAttribute((String) session.getAttribute("mid")); 
=======

<<<<<<< HEAD
		application.removeAttribute((String) session.getAttribute("mid"));
		session.invalidate();
		return "redirect:../member/loginForm.do";
	}
	
	@RequestMapping(value="logoutForAdmin")
	public String logoutForAdmin(HttpSession session) {
=======
		/* application.removeAttribute((String) session.getAttribute("mid")); */
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
		session.invalidate();
		return "redirect:../member/loginForm.do";
	}
}
