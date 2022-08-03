package com.lec.divvyup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.GroupsService;
import com.lec.divvyup.vo.Groups;


@Controller
@RequestMapping(value="groups")
public class GroupsController {
	@Autowired
	private GroupsService groupsService;
	
	@RequestMapping(value="groupList", method = RequestMethod.GET)
	public String groupList(Model model, Groups groups) {
		model.addAttribute("groupList", groupsService.groupList());
		return "groups/groupList";
	}
	@RequestMapping(value="groupInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String groupInfo(int gid, Model model) {
		model.addAttribute("groupInfo", groupsService.groupInfo(gid));
		return "groups/groupInfo";
	}
}
