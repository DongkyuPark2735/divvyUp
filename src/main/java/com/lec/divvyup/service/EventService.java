package com.lec.divvyup.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.Member;


public interface EventService {
	public int insertEvent(Event event, MultipartHttpServletRequest mRequest);
	public List<Event> eventList(int gid);
	public Event getEvent(int eid);
	public int modifyEvent(MultipartHttpServletRequest mRequest, Event event);
	public int deleteEvent(int eid);
	public int step5BeforeDeleteGroup(int gid);
}
