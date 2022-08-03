package com.lec.divvyup.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qboard {
	private int qbid;
	private String mid;
	private String qbtitle;
	private String qbcontent;
	private Date qbrdate;
	private String qbip;
	private int qbreplycheck;
	private int startRow;
	private int endRow;
	
}
