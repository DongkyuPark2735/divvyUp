package com.lec.divvyup.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

@Service
public class AdminSearchExcelDownloadService {

	public void memberExcelDownload(HttpServletResponse response, String[] mids, String[] mnames, String[] memails,
			String[] mrdates) throws IOException {
		XSSFWorkbook wb = new XSSFWorkbook();

		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분"); 
		String strNowDate = simpleDateFormat.format(nowDate); 
		
		XSSFSheet sheet = wb.createSheet(strNowDate + " 회원 정보");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;

		sheet.setDefaultColumnWidth(15); // sheet 전체 기본 너비설정

		// 테이블 헤더용 스타일   
		CellStyle headStyle = wb.createCellStyle();
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);
		
		//배경   
		headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_80_PERCENT.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		headStyle.setAlignment(HorizontalAlignment.CENTER);

		CellStyle bodyStyle = wb.createCellStyle();
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);
		bodyStyle.setAlignment(HorizontalAlignment.CENTER);
		
		// Header
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellValue("");
		cell = row.createCell(1);
		cell.setCellValue("회원 ID");
		cell = row.createCell(2);
		cell.setCellValue("회원 이름");
		cell = row.createCell(3);
		cell.setCellValue("회원 이메일");
		cell = row.createCell(4);
		cell.setCellValue("회원 가입일");

		// Body
		for (int i = 0; i < mids.length; i++) {
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(mids[i]);
			cell = row.createCell(2);
			cell.setCellValue(mnames[i]);
			cell = row.createCell(3);
			cell.setCellValue(memails[i]);
			cell = row.createCell(4);
			cell.setCellValue(mrdates[i]);
		}
		
		String excelFileName = strNowDate + "memberSearch.xlsx";
		
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename="+ excelFileName);

		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}
}
