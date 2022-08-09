package com.lec.divvyup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.NotificationHistoryService;
import com.lec.divvyup.util.Paging;
import com.lec.divvyup.vo.NotificationHistory;

@Controller
@RequestMapping(value="notification")
public class NotificationHistoryController {
	@Autowired
	private NotificationHistoryService notificationHistoryService;
	
	@RequestMapping(value="notificationConfirmForm", method=RequestMethod.GET)
	public String notificationConfirmForm(NotificationHistory notificationHistory, String pageNum, Model model, HttpSession session) {
		model.addAttribute("allNotification", notificationHistoryService.getAllNotificationList(notificationHistory, pageNum, session));
		model.addAttribute("paging", new Paging(notificationHistoryService.getAllNotificationCnt(session, notificationHistory), pageNum));
		notificationHistoryService.updateUncheckNotification(session, notificationHistory);
		return "notification/notificationConfirmForm";
	}
	
	@RequestMapping(value="uncheckedNotificationList", method=RequestMethod.GET)
	public String uncheckedNotificationList(NotificationHistory notificationHistory, String pageNum, Model model, HttpSession session) {
		model.addAttribute("uncheckedNotificationList", notificationHistoryService.getUncheckdNotificationList(notificationHistory, pageNum, session));
		model.addAttribute("pagig", new Paging(notificationHistoryService.getUncheckdNotificationCnt(session, notificationHistory), pageNum));
		return "notification/uncheckedNotificationList";
	}
}
