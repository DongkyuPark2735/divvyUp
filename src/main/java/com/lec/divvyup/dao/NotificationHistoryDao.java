package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.NotificationHistory;

@Mapper
public interface NotificationHistoryDao {
	public int insertFollowNotification(NotificationHistory notificationHistory);
	public int insertUnfollowNotification(NotificationHistory notificationHistory);
	public int insertGroupNotification(NotificationHistory notificationHistory);
	public int getUncheckdNotificationCnt(NotificationHistory notificationHistory);
	public List<NotificationHistory> getUncheckdNotificationList(NotificationHistory notificationHistory);
	public int updateUncheckNotification(NotificationHistory notificationHistory);
	public int getAllNotificationCnt(NotificationHistory notificationHistory);
	public List<NotificationHistory> getAllNotificationList(NotificationHistory notificationHistory);
}
