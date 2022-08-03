package com.lec.divvyup.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.AboardService;
import com.lec.divvyup.service.QboardService;
import com.lec.divvyup.util.Paging;
import com.lec.divvyup.vo.Aboard;

@Controller
@RequestMapping(value="qboard")
public class QboardController {
	@Autowired
	private QboardService qboardService;
	@Autowired
	private AboardService aboardService;
	
	@RequestMapping(value="listQboardForMember", method=RequestMethod.GET)
	public String listQboardForMember(String pageNum, Model model) {
		model.addAttribute("listQboardForMember", qboardService.listQboardForMember(pageNum));
		model.addAttribute("paging", new Paging(qboardService.getQboardTotCntForMember(), pageNum));
		return "QnAboard/listQboardForMember";
	}
	
	@RequestMapping(value="viewQboard", method={RequestMethod.GET, RequestMethod.POST})
	public String viewQboard(int qbid, Model model) {
		model.addAttribute("qboard", qboardService.viewQboard(qbid));
		model.addAttribute("aboard", aboardService.viewAboard(qbid));
		return "QnAboard/viewQboard";
	}
	
	@RequestMapping(value="listUncheckedQboardForAdmin", method=RequestMethod.GET)
	public String listUncheckedQboardForAdmin(String pageNum, Model model) {
		model.addAttribute("listUncheckedQboardForAdmin", qboardService.listUncheckedQboardForAdmin(pageNum));
		model.addAttribute("paging", new Paging(qboardService.getUncheckedQboardTotCntForAdmin(), pageNum));
		return "QnAboard/listUncheckedQboardForAdmin";
	}
	
}
