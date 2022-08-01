package com.lec.divvyup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MController {

		
	@RequestMapping("main")
	public String mainView() {
		return "main/main";
	}
	
	

}
