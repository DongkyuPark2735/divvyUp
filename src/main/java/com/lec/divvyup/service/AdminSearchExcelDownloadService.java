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

	//	회원 엑셀 다운로드
	public void excelDownloadMember(HttpServletResponse response, String[] mids, String[] mnames, String[] memails,
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
	
	//	그룹 엑셀 다운로드
	public void excelDownloadGroup(HttpServletResponse response, 
		String[] gids, String[] gnames, String[] grdates, String[] gcontents, String[] mids
			) throws IOException {
		XSSFWorkbook wb = new XSSFWorkbook();
		
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분"); 
		String strNowDate = simpleDateFormat.format(nowDate); 
		
		XSSFSheet sheet = wb.createSheet(strNowDate + " 그룹 정보");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		
		sheet.setDefaultColumnWidth(15); // sheet 전체 기본 너비설정
		
		// Header
		row = sheet.createRow(rowNum++);
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellValue("");
		cell = row.createCell(1);
		cell.setCellValue("그룹 ID");
		cell = row.createCell(2);
		cell.setCellValue("그룹 이름");
		cell = row.createCell(3);
		cell.setCellValue("그룹 생성일");
		cell = row.createCell(4);
		cell.setCellValue("그룹 내용");
		cell = row.createCell(5);
		cell.setCellValue("그룹 생성 회원 ID");
		
		// Body
		for (int i = 0; i < gids.length; i++) {
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(gids[i]);
			cell = row.createCell(2);
			cell.setCellValue(gnames[i]);
			cell = row.createCell(3);
			cell.setCellValue(grdates[i]);
			cell = row.createCell(4);
			cell.setCellValue(gcontents[i]);
			cell = row.createCell(5);
			cell.setCellValue(mids[i]);
		}
		
		String excelFileName = strNowDate + "groupSearch.xlsx";
		
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename="+ excelFileName);
		
		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}
	
	//	지출 기록 엑셀 다운로드
	public void excelDownloadEvents(HttpServletResponse response, 
			String[] eids, String[] enames, String[] econtents, String[] eamounts, String[] eaddresses, 
			String[] ecounts, String[] erdates, String[] mids, String[] gids
			) throws IOException {
		XSSFWorkbook wb = new XSSFWorkbook();
		
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분"); 
		String strNowDate = simpleDateFormat.format(nowDate); 
		
		XSSFSheet sheet = wb.createSheet(strNowDate + " 지출 기록 정보");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		
		sheet.setDefaultColumnWidth(15); // sheet 전체 기본 너비설정
		
		// Header
		row = sheet.createRow(rowNum++);
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellValue("");
		cell = row.createCell(1);
		cell.setCellValue("지출 기록 ID");
		cell = row.createCell(2);
		cell.setCellValue("지출 기록명");
		cell = row.createCell(3);
		cell.setCellValue("지출 기록 내용");
		cell = row.createCell(4);
		cell.setCellValue("지출 금액");
		cell = row.createCell(5);
		cell.setCellValue("지출 장소");
		cell = row.createCell(6);
		cell.setCellValue("지출 기록 회원수");
		cell = row.createCell(7);
		cell.setCellValue("지출 기록 생성일");
		cell = row.createCell(8);
		cell.setCellValue("지출 기록 생성 회원ID");
		cell = row.createCell(9);
		cell.setCellValue("지출 기록 생성 그룹");
		
		// Body
		for (int i = 0; i < eids.length; i++) {
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(eids[i]);
			cell = row.createCell(2);
			cell.setCellValue(enames[i]);
			cell = row.createCell(3);
			cell.setCellValue(econtents[i]);
			cell = row.createCell(4);
			cell.setCellValue(eamounts[i]);
			cell = row.createCell(5);
			cell.setCellValue(eaddresses[i]);
			cell = row.createCell(6);
			cell.setCellValue(ecounts[i]);
			cell = row.createCell(7);
			cell.setCellValue(erdates[i]);
			cell = row.createCell(8);
			cell.setCellValue(mids[i]);
			cell = row.createCell(9);
			cell.setCellValue(gids[i]);
		}
		
		String excelFileName = strNowDate + "eventsSearch.xlsx";
		
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename="+ excelFileName);
		
		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}
}
