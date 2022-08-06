package com.lec.divvyup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.service.CentralSystemService;
import com.lec.divvyup.service.GroupDetailService;
import com.lec.divvyup.service.GroupsService;
import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.Groups;


@Controller
@RequestMapping(value="groups")
public class GroupsController {
	@Autowired
	private GroupsService groupsService;
	@Autowired
	private GroupDetailService groupDetailService;
	@Autowired
	private CentralSystemService centralSystemService;
	
	@RequestMapping(value="groupList", method = RequestMethod.GET)
	public String groupList(Model model, Groups groups) {
		model.addAttribute("groupList", groupsService.groupList());
		return "groups/groupList";
	}
	@RequestMapping(value="groupInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String groupInfo(int gid, Model model) {
		model.addAttribute("groupInfo", groupsService.groupInfo(gid));
		model.addAttribute("groupDetailList", groupDetailService.groupDetailList(gid));
		model.addAttribute("check", centralSystemService.checkAddition(gid));
		System.out.println(centralSystemService.checkAddition(gid));
		return "groups/groupInfo";
	}
	@RequestMapping(value="groupInsertForm", method=RequestMethod.GET)
	public String registerForm(Model model) {
		model.addAttribute("nextGid", groupsService.nextGid());
		model.addAttribute("memberList", groupsService.memberList());
		return "groups/groupInsertForm";
	}
	@RequestMapping(value="groupInsert", method=RequestMethod.POST)
	public String register(MultipartHttpServletRequest mRequest, @ModelAttribute("gDto") Groups groups, String [] mids, String mid, Model model) {
		model.addAttribute("InsertResult", groupsService.groupInsert(groups, mRequest));
		groupDetailService.insertGroupDetail(mids);
		/* groupDetailService.insertGroupDetail(mid); */ //나중에 멤버 아닌 친구에서 뿌려줄때는, 친구 리스트에 내 이름이 없기에, 이걸 따로 추가해애야함
		return "groups/groupList"; 
	}
	

	
	
	

}
