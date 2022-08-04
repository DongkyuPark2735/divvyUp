package com.lec.divvyup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
@RequestMapping(value="centralSystem")
public class CentralSystemController {
	@Autowired
	private CentralSystemService centralSystemService;
	
	@RequestMapping(value="divide", method=RequestMethod.POST)
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
}
