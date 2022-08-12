package com.lec.divvyup.controller;

import javax.servlet.http.HttpSession;

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
import com.lec.divvyup.service.GroupBoardService;
import com.lec.divvyup.service.GroupDetailService;
import com.lec.divvyup.service.GroupsService;
import com.lec.divvyup.service.NotificationHistoryService;
import com.lec.divvyup.vo.Groups;
import com.lec.divvyup.vo.NotificationHistory;


@Controller
@RequestMapping(value="groups")
public class GroupsController {
	@Autowired
	private GroupsService groupsService;
	@Autowired
	private GroupDetailService groupDetailService;
	@Autowired
	private CentralSystemService centralSystemService;
	@Autowired
	private GroupBoardService groupBoardService;
	@Autowired
	private EventService eventService;
	@Autowired
	private EventDetailService eventDetailService;
	@Autowired
	private EventHistoryService eventHistoryService;
	@Autowired
	private NotificationHistoryService notificationHistoryService;
	
	@RequestMapping(value="groupList", method = RequestMethod.GET)
	public String groupList(Model model, Groups groups, String mid) {
		model.addAttribute("groupList", groupsService.groupList(mid));
		model.addAttribute("followList", groupsService.followList(mid));
		return "groups/groupList";
	}
	@RequestMapping(value="groupInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String groupInfo(int gid, Model model) {
		model.addAttribute("groupInfo", groupsService.groupInfo(gid));
		model.addAttribute("groupDetailList", groupDetailService.groupDetailList(gid));
		model.addAttribute("check", centralSystemService.checkAddition(gid));
		model.addAttribute("checkAllPaid",  centralSystemService.checkAllPaid(gid));
		model.addAttribute("done", centralSystemService.checkFinishSplit(gid));
		return "groups/groupInfo";
	}
	@RequestMapping(value="groupInsertForm", method=RequestMethod.GET)
	public String registerForm(Model model, String mid) {
		model.addAttribute("nextGid", groupsService.nextGid());
		model.addAttribute("followList", groupsService.followList(mid));
		return "groups/groupInsertForm";
	}
	@RequestMapping(value="groupInsert", method=RequestMethod.POST)
	public String register(MultipartHttpServletRequest mRequest, @ModelAttribute("gDto") Groups groups, String mid, String [] fids, Model model) {
		model.addAttribute("InsertResult", groupsService.groupInsert(groups, mRequest));
		groupDetailService.insertGroupDetail(fids);
		groupDetailService.insertGroupDetail(mid);
		notificationHistoryService.insertGroupNotification(mid, fids);
		return "groups/groupList"; 
	}
	@RequestMapping(value="modifyForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String modifyForm(int gid, Model model, String mid) {
		model.addAttribute("groupInfo", groupsService.groupInfo(gid));
		model.addAttribute("followList", groupsService.followList(mid));
		model.addAttribute("groupDetailList", groupDetailService.groupDetailList(gid));
		return "groups/modifyForm";
	}
	@RequestMapping(value="modify", method = RequestMethod.POST)
		public String modify(MultipartHttpServletRequest mRequest, @ModelAttribute("gDto") Groups groups, Model model, String pageNum, int gid, String [] fids) {
		groupsService.modify(mRequest, groups);
		groupDetailService.insertGroupDetailNew(fids, gid);
		return "redirect:../groups/groupInfo.do?gid="+gid;
	}
	@RequestMapping(value="deleteGroup", method = RequestMethod.GET)
	public String deleteGroup(int gid) {
		groupBoardService.step1BeforeDeleteGroup(gid);
		groupDetailService.step2BeforeDeleteGroup(gid);
		eventHistoryService.step3BeforeDeleteGroup(gid);
		eventDetailService.step4BeforeDeleteGroup(gid);
		eventService.step5BeforeDeleteGroup(gid);
		centralSystemService.step6BeforeDeleteGroup(gid);
		groupsService.finalStepDeleteGroup(gid);
	return "groups/groupList";
}
	
	
	

	
	
	

}
