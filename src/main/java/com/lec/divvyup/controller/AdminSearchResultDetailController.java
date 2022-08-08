package com.lec.divvyup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.EventService;
import com.lec.divvyup.service.FollowService;
import com.lec.divvyup.service.GroupDetailService;
import com.lec.divvyup.service.GroupsService;
import com.lec.divvyup.service.MemberService;

@Controller
@RequestMapping(value = "AdminSearchResultDetail")
public class AdminSearchResultDetailController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	FollowService followService; 
	@Autowired
	GroupsService groupsService; 
	@Autowired
	EventService eventService; 
	@Autowired
	GroupDetailService groupDetailService; 
	

	@RequestMapping(value = "SearchResultDetailMember", method = RequestMethod.GET)
	public String SearchResultDetailMember(String mid, Model model) {
		model.addAttribute("memberDetail", memberService.getMember(mid));
		model.addAttribute("groupList", groupsService.groupList());
		model.addAttribute("followerList", followService.forAdminmyFollowerList(mid));
		model.addAttribute("followingList", followService.forAdminMyFollowingList(mid));
		return "adminSearchResultDetail/SearchResultDetailMember";
	}

	@RequestMapping(value = "SearchResultDetailGroup", method = RequestMethod.GET)
	public String SearchResultDetailGroup(int gid, Model model) {
		model.addAttribute("groupDetail", groupsService.groupInfo(gid));
		model.addAttribute("evetsList", eventService.eventList(gid));
		model.addAttribute("groupMemeberList", groupDetailService.groupDetailList(gid));
		return "adminSearchResultDetail/SearchResultDetailGroup";
	}
	
	
	
}
