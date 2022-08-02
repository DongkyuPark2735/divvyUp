package com.lec.divvyup.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.service.EventDetailService;
import com.lec.divvyup.service.EventService;
import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.EventDetail;


@Controller
@RequestMapping(value="event")
public class EventController {
	@Autowired
	private EventService eventService;
	@Autowired
	private EventDetailService eventDetailService;
	
	@RequestMapping(value="insertEventForm", method = RequestMethod.GET)
	public String insertEventForm(Model model, int gid) {
		model.addAttribute("printMidList", eventDetailService.printMidList(gid));
		return "event/insertEventForm";
	}
	
	@RequestMapping(value="insertEvent", method=RequestMethod.POST)
	public String insertEvent(MultipartHttpServletRequest mRequest, @ModelAttribute("eDto") Event event, String[] mids, Model model) {
		model.addAttribute("insertEvent", eventService.insertEvent(event, mRequest));
		eventDetailService.insertEventDetail(mids);
		return "event/eventList";
	}
	
	@RequestMapping(value="eventList", method={RequestMethod.GET, RequestMethod.POST})
	public String eventList(Model model, int gid) {
		model.addAttribute("eventList", eventService.eventList(gid));
		return "event/eventList";
	}
	
	
	
	
}
