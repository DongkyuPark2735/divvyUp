package com.lec.divvyup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.divvyup.service.GroupBoardService;
import com.lec.divvyup.vo.GroupBoard;

@Controller
@RequestMapping(value = "groupboard")
public class GropBoardController {
		
	@Autowired
	private GroupBoardService groupBoardService;
	
	@RequestMapping(value = "main")
	public String mainView() {
		return "main/main";
	}
	
	@RequestMapping(value = "groupDetil")
	public String listLatest20Groupboard(int gid, Model model) {
		model.addAttribute("grouplist", groupBoardService.listLatest20Groupboard(gid)); 
		return "groupBoard/groupDetail";
	}

	@RequestMapping(value = "listPast")
	public String listPast20Groupboard(GroupBoard groupBoard, Model model) {
		model.addAttribute("grouplist", groupBoardService.listPast20Groupboard(groupBoard)); 
		return "groupBoard/groupDetail";
	}
	
	

}
