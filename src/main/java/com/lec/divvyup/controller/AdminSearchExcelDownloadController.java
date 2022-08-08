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
	
	@RequestMapping(value = "excelDownloadMember", method = RequestMethod.POST)
	public void excelDownloadMember(HttpServletResponse response,
			String[] mids, String[] mnames, String[] memails, String[] mrdates 
			) throws IOException {
		adminSearchExcelDownloadService.excelDownloadMember(response, mids, mnames, memails, mrdates);
	}

	@RequestMapping(value = "excelDownloadGroup", method = RequestMethod.POST)
	public void excelDownloadGroup(HttpServletResponse response,
			String[] gids, String[] gnames, String[] grdates, String[] gcontents, String[] mids
			) throws IOException {
		adminSearchExcelDownloadService.excelDownloadGroup(response, gids, gnames, grdates, gcontents, mids);
	}

	@RequestMapping(value = "excelDownloadEvents", method = RequestMethod.POST)
	public void excelDownloadEvents(HttpServletResponse response,
			String[] eids, String[] enames, String[] econtents, String[] eamounts, String[] eaddresses, 
			String[] ecounts, String[] erdates, String[] mids, String[] gids
			) throws IOException {
		adminSearchExcelDownloadService.excelDownloadEvents
		(response, eids, enames, econtents, eamounts, eaddresses, ecounts, erdates, mids, gids);
	}
	
}
