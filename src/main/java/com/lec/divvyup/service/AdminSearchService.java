package com.lec.divvyup.service;

import java.util.List;

import com.lec.divvyup.vo.AdminSearchKeyWord;
import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.Groups;
import com.lec.divvyup.vo.Member;

public interface AdminSearchService {
	public List<Member> memberSearch(AdminSearchKeyWord adminSearchKeyWord);
	public List<Groups> groupSearch(AdminSearchKeyWord adminSearchKeyWord);
	public List<Event> eventSearch(AdminSearchKeyWord adminSearchKeyWord);
}
