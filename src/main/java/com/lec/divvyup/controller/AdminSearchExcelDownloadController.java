package com.lec.divvyup.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.dao.AdminSearchDao;
import com.lec.divvyup.service.AdminSearchExcelDownloadService;
import com.lec.divvyup.vo.AdminSearchKeyWord;

@Controller
@RequestMapping(value = "excel")
public class AdminSearchExcelDownloadController {

	@Autowired
	AdminSearchExcelDownloadService adminSearchExcelDownloadService;
	
	@RequestMapping(value = "excelDownloadMember", method = RequestMethod.POST)
	public void excelDownloadMember(HttpServletResponse response, AdminSearchKeyWord adminSearchKeyWord) throws IOException {
		adminSearchExcelDownloadService.excelDownloadMember(response, adminSearchKeyWord);
	}

	@RequestMapping(value = "excelDownloadGroup", method = RequestMethod.POST)
	public void excelDownloadGroup(HttpServletResponse response, AdminSearchKeyWord adminSearchKeyWord) throws IOException {
		adminSearchExcelDownloadService.excelDownloadGroup(response, adminSearchKeyWord);
	}

	@RequestMapping(value = "excelDownloadEvents", method = RequestMethod.POST)
	public void excelDownloadEvents(HttpServletResponse response,AdminSearchKeyWord adminSearchKeyWord) throws IOException {
		adminSearchExcelDownloadService.excelDownloadEvents(response, adminSearchKeyWord);
	}
	
}
