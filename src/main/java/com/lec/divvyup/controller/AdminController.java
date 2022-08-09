package com.lec.divvyup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.AdminService;

@Controller
@RequestMapping(value="admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="adminloginForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String adminloginForm() {
		return "admin/adminloginForm";
	}
	
	@RequestMapping(value="adminlogin", method=RequestMethod.POST)
	public String adminlogin(String aid, String apw, Model model, HttpSession session) {
		String result = adminService.aloginCheck(aid, apw, session);
		if(result.equals("관리자 로그인 성공")) {
			return "forward:../main/mainforAdmin.do";
		}else {
			model.addAttribute("aid", aid);
			model.addAttribute("apw", apw);
			model.addAttribute("adminloginResult", result);
			return "forward:adminloginForm.do";
		}
	}
}
