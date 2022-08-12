package com.lec.divvyup.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.AdminSearchDao;
import com.lec.divvyup.vo.AdminSearchKeyWord;
import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.Groups;
import com.lec.divvyup.vo.Member;

@Service
public class AdminSearchServiceImpl implements AdminSearchService {
	
	@Autowired
	AdminSearchDao adminSearchDao;
	
	@Override
	public List<Member> memberSearch(AdminSearchKeyWord adminSearchKeyWord) {
		ArrayList<Member> mList = new ArrayList<Member>();
		mList = (ArrayList<Member>) adminSearchDao.memberSearch(adminSearchKeyWord);
		return mList;
	}

	@Override
	public List<Groups> groupSearch(AdminSearchKeyWord adminSearchKeyWord) {
		ArrayList<Groups> gList = new ArrayList<Groups>();
		gList = (ArrayList<Groups>) adminSearchDao.groupSearch(adminSearchKeyWord);
		return gList;
	}

	@Override
	public List<Event> eventSearch(AdminSearchKeyWord adminSearchKeyWord) {
		ArrayList<Event> eList = new ArrayList<Event>();
		eList = (ArrayList<Event>) adminSearchDao.eventSearch(adminSearchKeyWord);
		return eList;
	}

	
	
}
