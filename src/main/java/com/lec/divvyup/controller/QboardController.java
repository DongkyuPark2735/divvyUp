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
import com.lec.divvyup.vo.Qboard;

@Controller
@RequestMapping(value="qboard")
public class QboardController {
	@Autowired
	private QboardService qboardService;
	@Autowired
	private AboardService aboardService;
	
	@RequestMapping(value="listQboardForMember", method={RequestMethod.GET, RequestMethod.POST})
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
	
	@RequestMapping(value="listUncheckedQboardForAdmin", method={RequestMethod.GET, RequestMethod.POST})
	public String listUncheckedQboardForAdmin(String pageNum, Model model) {
		model.addAttribute("listUncheckedQboardForAdmin", qboardService.listUncheckedQboardForAdmin(pageNum));
		model.addAttribute("paging", new Paging(qboardService.getUncheckedQboardTotCntForAdmin(), pageNum));
		return "QnAboard/listUncheckedQboardForAdmin";
	}
	@RequestMapping(value="listCheckedQboardForAdmin", method={RequestMethod.GET, RequestMethod.POST})
	public String listCheckedQboardForAdmin(String pageNum, Model model) {
		model.addAttribute("listUncheckedQboardForAdmin", qboardService.listCheckedQboardForAdmin(pageNum));
		model.addAttribute("paging", new Paging(qboardService.getCheckedQboardTotCntForAdmin(), pageNum));
		return "QnAboard/listCheckedQboardForAdmin";
	}
	
	@RequestMapping(value="writeQboardForm", method=RequestMethod.GET)
	public String writeQboardForm() {
		return "QnAboard/writeQboardForm";
	}
	
	@RequestMapping(value="writeQboard", method=RequestMethod.POST)
	public String writeQboard(Qboard qboard, HttpServletRequest request, Model model) {
		model.addAttribute("writeQboardResult", qboardService.writeQboard(qboard, request));
		return "forward:/qboard/listQboardForMember.do";
	}
	
	@RequestMapping(value="listQboardForMe", method={RequestMethod.GET, RequestMethod.POST})
	public String listQboardForMe(String mid, String pageNum, Model model) {
		model.addAttribute("listQboardForMe", qboardService.listQboardForMe(mid, pageNum));
		model.addAttribute("paging", new Paging(qboardService.getQboardTotCntForMe(mid), pageNum));
		return "QnAboard/listQboardForMe";
	}
	
	@RequestMapping(value="modifyQboardForm", method=RequestMethod.GET)
	public String modifyQboardForm(int qbid, Model model) {
		model.addAttribute("qboard", qboardService.viewQboard(qbid));
		return "QnAboard/modifyQboardForm";
	}
	
	@RequestMapping(value="modifyQboard", method=RequestMethod.POST)
	public String modifyQboard(Qboard qboard, HttpServletRequest request, Model model) {
		model.addAttribute("modifyQboardResult", qboardService.modifyQboard(qboard, request));
		return "forward:/qboard/viewQboard.do";
	}
	
	
}
