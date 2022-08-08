package com.lec.divvyup.controller;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.sl.usermodel.ObjectMetaData.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.service.GroupBoardService;
import com.lec.divvyup.vo.GroupBoard;

@Controller
@RequestMapping(value = "groupboard")
public class GroupBoardController {

	@Autowired
	ServletContext application;
	
	@Autowired
	private GroupBoardService groupBoardService;

//	대화 리스트 20개 출력
	@RequestMapping(value = "groupDetil")
	public String listLatest20Groupboard(int gid, Model model, HttpSession session) {
		session.setAttribute("sesiongGid", gid);
		
		application.setAttribute(String.valueOf(gid), gid);
		// 123, 123
		// 234, 234 
		// 545, 545
		ArrayList<Integer> sessionMList = null;
		sessionMList.add((Integer)gid);
		System.out.println(sessionMList);
		sessionMList.remove((Integer)gid);
		System.out.println(sessionMList);
		String mlist;
		for(Integer mi : sessionMList) {
//			mlist = mlist + String.valueOf(mi);
		}
		application.setAttribute("sessionMList", sessionMList);
		model.addAttribute("grouplist", groupBoardService.listLatest20Groupboard(gid)); 
		return "groupBoard/groupDetail";
	}

//	지난 대화20개 가져오기
	@RequestMapping(value = "pastGroupBoardList", method = RequestMethod.GET)
	public String  listPast20Groupboard(GroupBoard groupBoard, Model model) {
		model.addAttribute("pastList", groupBoardService.listPast20Groupboard(groupBoard)); 
		return "groupBoard/groupBoardPastList";
	}

//	글 입력
	@RequestMapping(value = "insertGroupBoard", method = RequestMethod.POST)
	public String insertGroupBoard(GroupBoard groupBoard, Model model, MultipartHttpServletRequest mRequest) {
		System.out.println("들어온 groupBoard"+groupBoard);
		System.out.println("들어온 mRequest"+mRequest);
		groupBoardService.insertGroupboard(groupBoard, mRequest); 
		return "groupBoard/groupBoardInsert";
	}
//	타이머 글 가져오기
	@RequestMapping(value = "singleLatestGroupboard", method = RequestMethod.GET)
	public String singleLatestGroupboard(int gid, Model model) {
		model.addAttribute("singleLatestGroupboard", groupBoardService.singleLatestGroupboard(gid)); 
		return "groupBoard/groupBoardSingleBoard";
		
	}
//	글 삭제
	@RequestMapping(value = "deleteGroupBoard", method = {RequestMethod.POST, RequestMethod.GET})
	public void deleteGroupBoard(int gbid, Model model) {
		groupBoardService.deleteGroupboard(gbid); 
	}
}









