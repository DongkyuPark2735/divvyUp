package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.AdminSearchKeyWord;
import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.Groups;
import com.lec.divvyup.vo.Member;

@Mapper
public interface AdminSearchDao {
	public List<Member> memberSearch(AdminSearchKeyWord adminSearchKeyWord);
	public List<Groups> groupSearch(AdminSearchKeyWord adminSearchKeyWord);
	public List<Event> eventSearch(AdminSearchKeyWord adminSearchKeyWord);
	
}


