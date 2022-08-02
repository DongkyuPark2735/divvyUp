package com.lec.divvyup.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.vo.Event;


public interface EventService {
	public int insertEvent(Event event, MultipartHttpServletRequest mRequest);
	public List<Event> eventList(int gid);
}
