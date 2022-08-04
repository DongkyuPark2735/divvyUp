package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Event;

@Mapper
public interface EventDao {
	public int insertEvent(Event event);
	public int insertEvent2(Event event);
	public List<Event> eventList(int gid);
	
}
