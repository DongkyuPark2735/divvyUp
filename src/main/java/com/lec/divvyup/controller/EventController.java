package com.lec.divvyup.controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.service.EventDetailService;
import com.lec.divvyup.service.EventHistoryService;
import com.lec.divvyup.service.EventService;
import com.lec.divvyup.service.GroupDetailService;
import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.EventDetail;
import com.lec.divvyup.vo.GroupDetail;


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
	
	@RequestMapping(value="selectEventType", method = RequestMethod.GET)
	public String selectEventType(Model model, int gid) {
		model.addAttribute("selectEventType", gid);
		return "event/selectEventType";
	}
	
	@RequestMapping(value="insertEventForm", method = RequestMethod.GET)
	public String insertEventForm(Model model, int gid) {
		model.addAttribute("printMidList", eventDetailService.printMidList(gid));
		return "event/insertEventForm";
	}
	
	@RequestMapping(value="insertEvent", method=RequestMethod.POST)
	public String insertEvent(MultipartHttpServletRequest mRequest, @ModelAttribute("eDto") Event event, String [] mids, String mid, Model model) {
		model.addAttribute("insertEvent", eventService.insertEvent(event, mRequest)); // STEP A : 새 이벤트 추가
		eventDetailService.insertEventDetail(mids); // STEP B1 : 돈 안낸사람들 이벤트 정보 추가
		eventDetailService.insertEventDetailPayer(mid); // STEP B2 :돈 낸사람 이벤트 정보 추가
		groupDetailService.updateGroupDetail(); //STEP C : 그룹 디테일에 현이벤트 관련 지출정보 업데이트
		eventHistoryService.insertEventHistory(); //STEP D :지출 내역에 정보 추가
		eventDetailService.deleteEventDetail(); //STEP E : 이벤트 디테일 (장바구니) 비움
		/* return "event/eventList"; */
		return "main/main";
	}
	@RequestMapping(value="insertEventForm2", method = RequestMethod.GET)
	public String insertEventForm2(Model model, int gid) {
		model.addAttribute("printMidList", eventDetailService.printMidList(gid));
		return "event/insertEventForm2";
	}
	@RequestMapping(value="insertEvent2", method=RequestMethod.POST) //집적입력
	public String insertEvent2(MultipartHttpServletRequest mRequest, @ModelAttribute("eDto") Event event, String[] mids, String mid, Model model, int[] share) {
		model.addAttribute("insertEvent2", eventService.insertEvent(event, mRequest)); // STEP A : 새 이벤트 추가
		eventDetailService.insertEventDetail2(mids, share); // STEP B1 : 돈 안낸사람들 이벤트 정보 추가
		eventDetailService.insertEventDetailPayer2(mid); // STEP B2 :돈 낸사람 이벤트 정보 추가
		groupDetailService.updateGroupDetail(); //STEP C : 그룹 디테일에 현이벤트 관련 지출정보 업데이트
		eventHistoryService.insertEventHistory(); //STEP D :지출 내역에 정보 추가
		eventDetailService.deleteEventDetail(); //STEP E : 이벤트 디테일 (장바구니) 비움
		/* return "event/eventList"; */  
		return "main/main";
	}
	
	
	@RequestMapping(value="eventList", method={RequestMethod.GET, RequestMethod.POST})
	public String eventList(Model model, int gid) {
		model.addAttribute("eventList", eventService.eventList(gid));
		return "event/eventList";
	}
	
}
