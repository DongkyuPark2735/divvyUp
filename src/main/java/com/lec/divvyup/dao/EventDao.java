package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Event;

@Mapper
public interface EventDao {
	public int insertEvent(Event event);
	public List<Event> eventList(int gid);
	public Event getEvent(int eid);
	public int modifyEvent(Event event);
	public int deleteEvent(int eid);
	public int step5BeforeDeleteGroup(int gid);
}
