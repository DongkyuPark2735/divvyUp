package com.lec.divvyup.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lec.divvyup.vo.NotificationHistory;

public interface NotificationHistoryService {
	public int insertFollowNotification(HttpSession session, NotificationHistory notificationHistory);
	public int insertUnfollowNotification(HttpSession session, NotificationHistory notificationHistory);
	public int insertGroupNotification(String mid, String [] fids);
	public int getUncheckdNotificationCnt(HttpSession session, NotificationHistory notificationHistory);
	public List<NotificationHistory> getUncheckdNotificationList(NotificationHistory notificationHistory,String pageNum, HttpSession session);
	public int updateUncheckNotification(HttpSession session, NotificationHistory notificationHistory);
	public int getAllNotificationCnt(HttpSession session, NotificationHistory notificationHistory);
	public List<NotificationHistory> getAllNotificationList(NotificationHistory notificationHistory, String pageNum, HttpSession session);
}
