package com.lec.divvyup.controller;

import java.util.ArrayList;
import java.util.List;

import javax.xml.ws.ResponseWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.lec.divvyup.service.GroupBoardService;
import com.lec.divvyup.vo.GroupBoard;

@Controller
@RequestMapping(value = "groupboard")
public class GroupBoardController {
		
	@Autowired
	private GroupBoardService groupBoardService;

	@RequestMapping(value = "groupDetil")
	public String listLatest20Groupboard(int gid, Model model) {
		model.addAttribute("grouplist", groupBoardService.listLatest20Groupboard(gid)); 
		return "groupBoard/groupDetail";
	}

//	@RequestMapping(value = "listPast", method = RequestMethod.GET)
//	@ResponseBody
//	public ModelAndView listPast20Groupboard(GroupBoard groupBoard, Model model) {
//		GroupBoard gboard = groupBoardService.singleLatestGroupboard(100);
//		System.out.println(gboard);
//		ArrayList<GroupBoard> gbList = (ArrayList<GroupBoard>) groupBoardService.listPast20Groupboard(groupBoard);
//		System.out.println(gbList);
//		
//		return gboard;
//		
//	}
	
	@RequestMapping(value = "insertGroupBoard", method = RequestMethod.POST)
	public String insertGroupBoard(GroupBoard groupBoard, Model model) {
		model.addAttribute("insertGroupBoardVO", groupBoardService.insertGroupboard(groupBoard)); 
		return "groupBoard/groupBoardInsert";
	}
	
	@RequestMapping(value = "singleLatestGroupboard", method = RequestMethod.GET)
	public String singleLatestGroupboard(int gid, Model model) {
		model.addAttribute("singleLatestGroupboard", groupBoardService.singleLatestGroupboard(gid)); 
		return "groupBoard/groupBoardSingleBoard";
	}
	
	
}









