package com.lec.unie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.unie.dao.EventDetailDao;
import com.lec.unie.dto.Book;
import com.lec.unie.dto.Event;
import com.lec.unie.dto.EventDetail;
import com.lec.unie.dto.Member2;
import com.lec.unie.service.EventDetailService;
import com.lec.unie.service.EventService;
import com.lec.unie.service.GroupDetailService;
import com.lec.unie.util.Paging;

@Controller
@RequestMapping(value="event")
public class EventController {
	@Autowired
	private EventService eventService;
	@Autowired
	private EventDetailService eventDetailService;
	
	@RequestMapping(params = "method=insertEventForm", method = RequestMethod.GET)
	public String insertEventForm(Model model, int gid) {
		model.addAttribute("printMidList", eventDetailService.printMidList(gid));
		return "event/insertEventForm";
	}
	
	@RequestMapping(params = "method=insertEvent", method = RequestMethod.POST)
	public String insertEvent(MultipartHttpServletRequest mRequest, @ModelAttribute("eDto") Event event, EventDetail eventDetail, HttpServletRequest request, String mid, Model model) {
		model.addAttribute("insertEvent", eventService.insertEvent(event, mRequest));
		model.addAttribute("insertEventDetail", eventDetailService.insertEventDetail(eventDetail, request, mid, model));
		return "event/eventList";
	}
	
	@RequestMapping(params="method=eventList", method={RequestMethod.GET, RequestMethod.POST})
	public String eventList(Model model, int gid) {
		model.addAttribute("eventList", eventService.eventList(gid));
		return "event/eventList";
	}
	
	
	
	
}
