package com.lec.divvyup.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "error")
public class ErrorController {
	
	@RequestMapping(value = "error404")
	public String error404(HttpServletResponse response, Model model, Exception e){
		model.addAttribute("errorMSG", e.getMessage()); 
		model.addAttribute("errorName", e.getClass().getName()); 
		
		log.warn("warn log");
		log.error("error log");
		log.info("logging");
		return "errorPage/404ErrorPage";
	}
	
	@RequestMapping(value = "error405")
	public String error405(HttpServletResponse response, Model model, Exception e) {
		model.addAttribute("errorMSG", e.getMessage()); 
		model.addAttribute("errorName", e.getClass().getName()); 
		
		System.out.println(e.getClass().getName());
		System.out.println(e.getMessage());
		
		return "errorPage/404ErrorPage";
			
	}
	
	@RequestMapping(value = "error500")
	public String error500(HttpServletResponse response, Model model, Exception e) {
		model.addAttribute("errorMSG", e.getMessage()); 
		model.addAttribute("errorName", e.getClass().getName()); 
		
		System.out.println(e.getClass().getName());
		System.out.println(e.getMessage());
		
		return "errorPage/404ErrorPage";
			
	}
	
}
