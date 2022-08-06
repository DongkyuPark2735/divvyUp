package com.lec.divvyup.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.divvyup.service.AdminSearchExcelDownloadService;

@Controller
@RequestMapping(value = "excel")
public class AdminSearchExcelDownloadController {

	@Autowired
	AdminSearchExcelDownloadService adminSearchExcelDownloadService;
	
	@RequestMapping(value = "excelDownload", method = RequestMethod.POST)
	public void excelDownload(HttpServletResponse response,
			String[] mids, String[] mnames, String[] memails, String[] mrdates 
			) throws IOException {
		adminSearchExcelDownloadService.memberExcelDownload(response, mids, mnames, memails, mrdates);
	}
}
