package com.lec.divvyup.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.AboardService;
import com.lec.divvyup.service.QboardService;
import com.lec.divvyup.vo.Aboard;

@Controller
@RequestMapping(value="aboard")
public class AboardController {
	@Autowired
	private AboardService aboardService;
	@Autowired
	private QboardService qboardService;
	
	@RequestMapping(value="writeAboardForm", method=RequestMethod.GET)
	public String writeAboardForm(int qbid, Model model) {
		model.addAttribute("qboard", qboardService.viewQboard(qbid));
		return "QnAboard/writeAboardForm";
	}
	
	@RequestMapping(value="writeAboard", method=RequestMethod.POST)
	public String writeAboard(Aboard aboard, HttpServletRequest request, Model model) {
		model.addAttribute("writeAboardResult", aboardService.writeAboard(aboard, request));
		return "forward:../qboard/viewQboard.do";
	}
	
	@RequestMapping(value="modifyAboardForm", method=RequestMethod.GET)
	public String modifyAboardForm(int qbid, int abid, Model model) {
		model.addAttribute("qboard", qboardService.viewQboard(qbid));
		model.addAttribute("aboard", aboardService.viewAboard(qbid));
		return "QnAboard/modfiyAboardForm";
	}
	
	@RequestMapping(value="modifyAboard", method=RequestMethod.POST)
	public String modifyAboard(Aboard aboard, HttpServletRequest request, Model model) {
		model.addAttribute("modifyAboardResult", aboardService.modifyAboard(aboard, request));
		return "forward:../qboard/viewQboard.do";
	}
}
