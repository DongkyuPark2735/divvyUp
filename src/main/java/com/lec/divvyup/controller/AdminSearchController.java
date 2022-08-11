package com.lec.divvyup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.AdminSearchServiceImpl;
import com.lec.divvyup.vo.AdminSearchKeyWord;

@Controller
@RequestMapping(value = "adminSearch")
public class AdminSearchController {

	@Autowired
	AdminSearchServiceImpl adminSearchServiceImpl;	
	
//	검색 메인으로
	@RequestMapping(value = "adminSearchMain", method = RequestMethod.GET)
	public String adminSearchMain() {
		return "adminSearch/adminSearchMain";
	}
	
//	회원 검색	
	@RequestMapping(value = "searchMemeber", method = RequestMethod.GET)
	public String searchMemeber(AdminSearchKeyWord adminSearchKeyWord, Model model) {
		model.addAttribute("searchMemberList", adminSearchServiceImpl.memberSearch(adminSearchKeyWord));
		model.addAttribute("barCheckMSG", "memberBar");
		model.addAttribute("searchKeyWord", adminSearchKeyWord);
		return "forward:adminSearchMain.do";
	}
// 	회원검색 스크롤
	@RequestMapping(value = "scrollSearchMemeber", method = RequestMethod.GET)
	public String scrollSearchMemeber(AdminSearchKeyWord adminSearchKeyWord, Model model) {
		System.out.println(adminSearchKeyWord);
		model.addAttribute("scrollSearchMemberList", adminSearchServiceImpl.memberSearch(adminSearchKeyWord));
		return "adminSearch/scrollSearchMember";
	}

//	그룹 검색	
	@RequestMapping(value = "searchGroup", method = RequestMethod.GET)
	public String searchGroup(AdminSearchKeyWord adminSearchKeyWord, Model model) {
		model.addAttribute("searchGroupList", adminSearchServiceImpl.groupSearch(adminSearchKeyWord));
		model.addAttribute("barCheckMSG", "groupBar");
		model.addAttribute("searchKeyWord", adminSearchKeyWord);
		return "forward:adminSearchMain.do";
	}

// 	그룹검색 스크롤
	@RequestMapping(value = "scrollSearchGroup", method = RequestMethod.GET)
	public String scrollSearchGroup(AdminSearchKeyWord adminSearchKeyWord, Model model) {
		System.out.println(adminSearchKeyWord);
		model.addAttribute("scrollSearchGroupList", adminSearchServiceImpl.groupSearch(adminSearchKeyWord));
		return "adminSearch/scrollSearchGroup";
	}
	
	
//	지출기록 검색	
	@RequestMapping(value = "searchEvent", method = RequestMethod.GET)
	public String searchEvent(AdminSearchKeyWord adminSearchKeyWord, Model model) {
		model.addAttribute("searchEventList", adminSearchServiceImpl.eventSearch(adminSearchKeyWord));
		model.addAttribute("barCheckMSG", "eventBar");
		model.addAttribute("searchKeyWord", adminSearchKeyWord);
		return "forward:adminSearchMain.do";
	}
	
// 	지출기록 검색 스크롤
	@RequestMapping(value = "scrollSearchEvent", method = RequestMethod.GET)
	public String scrollSearchEvent(AdminSearchKeyWord adminSearchKeyWord, Model model) {
		model.addAttribute("scrollSearchEventList", adminSearchServiceImpl.eventSearch(adminSearchKeyWord));
		return "adminSearch/scrollSearchMember";
	}
	
	
}
