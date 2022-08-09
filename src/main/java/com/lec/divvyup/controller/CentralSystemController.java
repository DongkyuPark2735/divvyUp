package com.lec.divvyup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.CentralSystemService;
import com.lec.divvyup.service.GroupDetailService;

@Controller
@RequestMapping(value="centralSystem")
	
public class CentralSystemController {
	@Autowired
	private CentralSystemService centralSystemService;
	@Autowired
	private GroupDetailService groupDetailService;
	
	@RequestMapping(value="insertSplit" ,  method={RequestMethod.GET, RequestMethod.POST})
	public String insertSplit(int gid, Model model) {
		centralSystemService.insertSplit(gid); //Add data point to central system (indication that splitting has begun)
		centralSystemService.totalSum(gid); //Sum of total money that needs to be paid by the payers
		return "redirect:../groups/groupInfo.do?gid="+gid;
	}
	@RequestMapping(value="payForm" ,  method={RequestMethod.GET, RequestMethod.POST})
	public String payForm(Model model, HttpSession session, int gid, String mid, int gdbalance) {
		model.addAttribute("gdbalance", gdbalance);
		model.addAttribute("gid", gid);
		model.addAttribute("getMemberinfo", centralSystemService.getMember(mid));
		return "centralSystem/confirmPay";
	}
	@RequestMapping(value="pay", method={RequestMethod.GET, RequestMethod.POST})
	public String pay(Model model, HttpSession session, String mid, int gid) {
		centralSystemService.pay(mid, gid); //adding the paid amount to CSAMOUNT
		groupDetailService.updateBalance(mid);  //zero out member's balance within groupdetail
		centralSystemService.allPayChk(); //checking if everyone paid (only updates to 1 is everyone paid)
		return "centralSystem/temp";
	}
	@RequestMapping(value="getForm" ,  method={RequestMethod.GET, RequestMethod.POST})
	public String getForm(Model model, HttpSession session, int gid, String mid, int gdbalance) {
		model.addAttribute("gdbalance", gdbalance);
		model.addAttribute("gid", gid);
		model.addAttribute("getMemberinfo", centralSystemService.getMember(mid));
		return "centralSystem/confirmGet";
	}
	@RequestMapping(value="get", method={RequestMethod.GET, RequestMethod.POST})
	public String get(Model model, HttpSession session, String mid, int gid) {
		centralSystemService.get(mid, gid, session);
		groupDetailService.updateBalance(mid);  
		centralSystemService.finishedSplit(gid); //Checking if split has finalized (everyone paid and everyone received)
		model.addAttribute("done", centralSystemService.checkFinishSplit(gid));
		return "centralSystem/temp";
	}

}
