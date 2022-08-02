package com.lec.divvyup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.GroupDetailService;
import com.lec.divvyup.vo.Groups;


@Controller
@RequestMapping(value="groupDetail")
public class GroupDetailController {
	@Autowired
	private GroupDetailService groupDetailService;
	
	
	@RequestMapping(value="insertGroupDetail", method = RequestMethod.GET)
	public String insertGroupDetail() {
		return "groupDetail/insertGroupForm";
	}
	@RequestMapping(value="groupDetailList", method= RequestMethod.GET)
	public String groupDetailList(Model model, Groups groups, int gid) {
		model.addAttribute("groupDetailList", groupDetailService.groupDetailList(gid));
		return "groupDetail/groupDetailList";
	}
}
