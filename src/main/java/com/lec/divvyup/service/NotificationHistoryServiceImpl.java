package com.lec.divvyup.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.NotificationHistoryDao;
import com.lec.divvyup.util.Paging;
import com.lec.divvyup.vo.Follow;
import com.lec.divvyup.vo.NotificationHistory;
@Service
public class NotificationHistoryServiceImpl implements NotificationHistoryService {
	@Autowired
	private NotificationHistoryDao notificationHistoryDao;
	@Override
	public int insertFollowNotification(HttpSession session, NotificationHistory notificationHistory) {
		// TODO Auto-generated method stub
		notificationHistory.setNotsender((String)session.getAttribute("mid"));
		notificationHistory.setNotreceiver(notificationHistory.getNotreceiver());
		return notificationHistoryDao.insertFollowNotification(notificationHistory);
	}
	
	@Override
	public int insertUnfollowNotification(HttpSession session, NotificationHistory notificationHistory) {
		// TODO Auto-generated method stub
		notificationHistory.setNotsender((String)session.getAttribute("mid"));
		notificationHistory.setNotreceiver(notificationHistory.getNotreceiver());
		return notificationHistoryDao.insertUnfollowNotification(notificationHistory);
	}
	
	@Override
	public int insertGroupNotification(String mid, String [] fids) {
		int result = 0;
		NotificationHistory notificationHistory = new NotificationHistory();
		for (String fid : fids) {
			notificationHistory.setNotreceiver(fid);
			notificationHistory.setNotsender(mid);
			result = notificationHistoryDao.insertGroupNotification(notificationHistory);
		}
		return result;
	}
	
	@Override
	public int getUncheckdNotificationCnt(HttpSession session, NotificationHistory notificationHistory) {
		// TODO Auto-generated method stub
		notificationHistory.setNotreceiver((String)session.getAttribute("mid"));
		return notificationHistoryDao.getUncheckdNotificationCnt(notificationHistory);
	}

	@Override
	public List<NotificationHistory> getUncheckdNotificationList(NotificationHistory notificationHistory, String pageNum, HttpSession session) {
		// TODO Auto-generated method stub
		notificationHistory.setNotreceiver((String)session.getAttribute("mid"));
		Paging paging = new Paging(notificationHistoryDao.getUncheckdNotificationCnt(notificationHistory), pageNum);
		notificationHistory.setStartRow(paging.getStartRow());
		notificationHistory.setEndRow(paging.getEndRow());
		return notificationHistoryDao.getUncheckdNotificationList(notificationHistory);
	}

	@Override
	public int updateUncheckNotification(HttpSession session, NotificationHistory notificationHistory) {
		// TODO Auto-generated method stub
		notificationHistory.setNotreceiver((String)session.getAttribute("mid"));
		System.out.println(notificationHistory);
		int result = notificationHistoryDao.getUncheckdNotificationCnt(notificationHistory);
		if(result != 0) { 
			notificationHistoryDao.updateUncheckNotification(notificationHistory);
		}
		return result;
	}

	@Override
	public int getAllNotificationCnt(HttpSession session, NotificationHistory notificationHistory) {
		// TODO Auto-generated method stub
		notificationHistory.setNotreceiver((String)session.getAttribute("mid"));
		return notificationHistoryDao.getAllNotificationCnt(notificationHistory);
	}

	@Override
	public List<NotificationHistory> getAllNotificationList(NotificationHistory notificationHistory, String pageNum, HttpSession session) {
		// TODO Auto-generated method stub
		notificationHistory.setNotreceiver((String)session.getAttribute("mid"));
		Paging paging = new Paging(notificationHistoryDao.getAllNotificationCnt(notificationHistory) ,pageNum);
		notificationHistory.setStartRow(paging.getStartRow());
		notificationHistory.setEndRow(paging.getEndRow());
		return notificationHistoryDao.getAllNotificationList(notificationHistory);
	}

}
