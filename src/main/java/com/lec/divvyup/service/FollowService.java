package com.lec.divvyup.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lec.divvyup.vo.Follow;

public interface FollowService {
	public int followMember(HttpSession session, Follow follow);
	public int unfollowMember(HttpSession session, Follow follow);
	public List<Follow> myFollowingList(HttpSession session);
	public List<Follow> myFollowerList(HttpSession session);
	public List<Follow> forAdminMyFollowingList(String mid);
	public List<Follow> forAdminmyFollowerList(String mid);
}
