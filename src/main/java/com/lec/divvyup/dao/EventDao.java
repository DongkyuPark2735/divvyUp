package com.lec.divvyup.dao;

import java.util.List;

import com.lec.divvyup.vo.Event;


public interface EventDao {
	public int insertEvent(Event event);
	public List<Event> eventList(int gid);
	
}
