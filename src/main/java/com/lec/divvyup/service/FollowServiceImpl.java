package com.lec.divvyup.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.FollowDao;
import com.lec.divvyup.vo.Follow;
import com.lec.divvyup.vo.Member;
@Service
public class FollowServiceImpl implements FollowService {
	Member member = new Member();
	Follow follow = new Follow();
	@Autowired
	private FollowDao followDao;
	@Override
	public int followMember(HttpSession session, Follow follow) {
		// TODO Auto-generated method stub
		// 팔로우하면 알람가도록 해야댐!
		follow.setFrom_mid((String)session.getAttribute("mid"));
		follow.setTo_mid(follow.getTo_mid());
		return followDao.followMember(follow);
	}
	@Override
	public int unfollowMember(HttpSession session, Follow follow) {
		follow.setFrom_mid((String)session.getAttribute("mid"));
		follow.setTo_mid(follow.getTo_mid());
		return followDao.unfollowMember(follow);
	}
	
	@Override
	public List<Follow> myFollowingList(HttpSession session) {
		// TODO Auto-generated method stub
		String mid = (String)session.getAttribute("mid");
		return followDao.myFollowingList(mid);
	}

	@Override
	public List<Follow> myFollowerList(HttpSession session) {
		// TODO Auto-generated method stub
		String mid = (String)session.getAttribute("mid");
		return followDao.myFollowerList(mid);
	}


}
