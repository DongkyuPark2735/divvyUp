package com.lec.divvyup.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.AdminSearchDao;
import com.lec.divvyup.vo.AdminSearchKeyWord;
import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.Groups;
import com.lec.divvyup.vo.Member;

@Service
public class AdminSearchExcelDownloadService {
	
	@Autowired
	AdminSearchDao adminSearchDao;
	
	//	회원 엑셀 다운로드
	public void excelDownloadMember(HttpServletResponse response, AdminSearchKeyWord adminSearchKeyWord ) throws IOException {
		ArrayList<Member> mList = (ArrayList<Member>) adminSearchDao.memberSearch(adminSearchKeyWord);
		
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
		for(Member m : mList) {
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(m.getMid());
			cell = row.createCell(2);
			cell.setCellValue(m.getMname());
			cell = row.createCell(3);
			cell.setCellValue(m.getMemail());
			cell = row.createCell(4);
			cell.setCellValue(m.getMemail());
		}
		
		String excelFileName = strNowDate + "memberSearch.xlsx";
		
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename="+ excelFileName);

		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}
	
	//	그룹 엑셀 다운로드
	public void excelDownloadGroup(HttpServletResponse response,AdminSearchKeyWord adminSearchKeyWord ) throws IOException {
		ArrayList<Groups> gList = (ArrayList<Groups>) adminSearchDao.groupSearch(adminSearchKeyWord);
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
		for (Groups g : gList) {
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(g.getGid());
			cell = row.createCell(2);
			cell.setCellValue(g.getGname());
			cell = row.createCell(3);
			cell.setCellValue(g.getGrdate());
			cell = row.createCell(4);
			cell.setCellValue(g.getGcontent());
			cell = row.createCell(5);
			cell.setCellValue(g.getMid());
		}
		
		String excelFileName = strNowDate + "groupSearch.xlsx";
		
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename="+ excelFileName);
		
		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}
	
	//	지출 기록 엑셀 다운로드
	public void excelDownloadEvents(HttpServletResponse response, AdminSearchKeyWord adminSearchKeyWord ) throws IOException {
		ArrayList<Event> eList = (ArrayList<Event>) adminSearchDao.eventSearch(adminSearchKeyWord);
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
		for (Event e : eList) {
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue("");
			cell = row.createCell(1);
			cell.setCellValue(e.getEid());
			cell = row.createCell(2);
			cell.setCellValue(e.getEname());
			cell = row.createCell(3);
			cell.setCellValue(e.getEcontent());
			cell = row.createCell(4);
			cell.setCellValue(e.getEamount());
			cell = row.createCell(5);
			cell.setCellValue(e.getEaddress());
			cell = row.createCell(6);
			cell.setCellValue(e.getEcount());
			cell = row.createCell(7);
			cell.setCellValue(e.getErdate());
			cell = row.createCell(8);
			cell.setCellValue(e.getMid());
			cell = row.createCell(9);
			cell.setCellValue(e.getGid());
		}
		
		String excelFileName = strNowDate + "eventsSearch.xlsx";
		
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename="+ excelFileName);
		
		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}
}
