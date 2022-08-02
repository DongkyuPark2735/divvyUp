package com.lec.unie.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.unie.dto.Event;

public interface EventService {
	public int insertEvent(Event event, MultipartHttpServletRequest mRequest);
	public List<Event> eventList(int gid);
}
