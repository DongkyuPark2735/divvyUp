package com.lec.divvyup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.service.CentralSystemService;
import com.lec.divvyup.service.EventDetailService;
import com.lec.divvyup.service.EventHistoryService;
import com.lec.divvyup.service.EventService;
import com.lec.divvyup.service.GroupDetailService;
import com.lec.divvyup.vo.Event;


@Controller
@RequestMapping(value="event")
public class EventController {
	@Autowired
	private EventService eventService;
	@Autowired
	private EventDetailService eventDetailService;
	@Autowired
	private GroupDetailService groupDetailService;
	@Autowired
	private EventHistoryService eventHistoryService;
	@Autowired
	private CentralSystemService centralSystemService;
	
	
	@RequestMapping(value="selectEventType", method = RequestMethod.GET)
	public String selectEventType(Model model, int gid) {
		model.addAttribute("selectEventType", gid);
		return "event/selectEventType";
	}
	
	@RequestMapping(value="insertEventForm", method = RequestMethod.GET)
	public String insertEventForm(Model model, int gid, String mid) {
		model.addAttribute("printMidList", eventDetailService.printMidList(gid));
		return "event/insertEventForm";
	}
	
	//[1] Spliting money equally between members
	@RequestMapping(value="insertEvent", method=RequestMethod.POST) 
	public String insertEvent(MultipartHttpServletRequest mRequest, @ModelAttribute("eDto") Event event, String [] mids, String mid, Model model, int gid) {
		model.addAttribute("insertEvent", eventService.insertEvent(event, mRequest)); // STEP A : Insert new event
		eventDetailService.insertEventDetail(mids); // STEP B1 : Adding info of participating members
		eventDetailService.insertEventDetailPayer(mid); // STEP B2 : Adding info of payer
		groupDetailService.updateGroupDetail(gid); //STEP C : updating each stakeholder's balance on group detail
		eventHistoryService.insertEventHistory(); //STEP D :adding all info to event history
		eventDetailService.deleteEventDetail(); //STEP E : empty event detail (cart)
		return "main/main";
	}
	@RequestMapping(value="insertEventForm2", method = RequestMethod.GET)
	public String insertEventForm2(Model model, int gid) {
		model.addAttribute("printMidList", eventDetailService.printMidList(gid));
		return "event/insertEventForm2";
	}
	
	//[1] Spliting money unequally between members (distinct shares for involving members)
	@RequestMapping(value="insertEvent2", method=RequestMethod.POST) //집적입력
	public String insertEvent2(MultipartHttpServletRequest mRequest, @ModelAttribute("eDto") Event event, String[] mids, String mid, Model model, int[] share, int gid) {
		model.addAttribute("insertEvent2", eventService.insertEvent(event, mRequest));
		eventDetailService.insertEventDetail2(mids, share);
		eventDetailService.insertEventDetailPayer2(mid);
		groupDetailService.updateGroupDetail(gid);
		eventHistoryService.insertEventHistory();
		eventDetailService.deleteEventDetail();
		return "main/main";
	}
	@RequestMapping(value="eventList", method={RequestMethod.GET, RequestMethod.POST})
	public String eventList(Model model, int gid) {
		model.addAttribute("eventList", eventService.eventList(gid));
		model.addAttribute("check", centralSystemService.checkAddition(gid));
		return "event/eventList";
	}
	@RequestMapping(value="modifyEventForm", method={RequestMethod.GET, RequestMethod.POST})
	public String modifyEventForm(Model model, int eid) {
		model.addAttribute("getEvent", eventService.getEvent(eid));
		model.addAttribute("getEventHistory", eventHistoryService.getEventHistory(eid));
		return "event/modifyEventForm";
	}
	@RequestMapping(value="modifyEvent", method = RequestMethod.POST)
	public String modifyEvent(MultipartHttpServletRequest mRequest, @ModelAttribute("eDto") Event event, Model model) {
		model.addAttribute("modifyEvent", eventService.modifyEvent(mRequest, event));
		return "event/eventList";
	}
	@RequestMapping(value="deleteEvent", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteEvent(int eid, int gid) {
		groupDetailService.rollbackEventInfo(eid, gid);
		eventHistoryService.deleteEventHistory(eid);
		eventService.deleteEvent(eid);
		return "main/main";
	}
	
}
