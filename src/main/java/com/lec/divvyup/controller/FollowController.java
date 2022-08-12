package com.lec.divvyup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.FollowService;
import com.lec.divvyup.service.NotificationHistoryService;
import com.lec.divvyup.vo.Follow;
import com.lec.divvyup.vo.NotificationHistory;

@Controller
@RequestMapping(value="follow")
public class FollowController {
	@Autowired
	private FollowService followService;
	

	@Autowired
	private NotificationHistoryService notificationHistoryService;
	
	@RequestMapping(value="followMember", method=RequestMethod.GET)
	public String followMember(Model model, HttpSession session, Follow follow, NotificationHistory notificationHistory) {
		model.addAttribute("followResult", followService.followMember(session, follow));
		notificationHistory.setNotreceiver(follow.getTo_mid());
		notificationHistoryService.insertFollowNotification(session, notificationHistory);
		return "forward:../main/mainto.do";
	}
	
	@RequestMapping(value="unfollowMember", method=RequestMethod.GET)
	public String unfollowMember(Model model, HttpSession session, Follow follow, NotificationHistory notificationHistory) {
		model.addAttribute("unfollowResult", followService.unfollowMember(session, follow));
		notificationHistory.setNotreceiver(follow.getTo_mid());
		notificationHistoryService.insertUnfollowNotification(session, notificationHistory);
		return "forward:../main/mainto.do";
	}
}
