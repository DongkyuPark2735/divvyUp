package com.lec.unie.dao;

import java.util.List;

import com.lec.unie.dto.Event;

public interface EventDao {
	public int insertEvent(Event event);
	public List<Event> eventList(int gid);
	
}
