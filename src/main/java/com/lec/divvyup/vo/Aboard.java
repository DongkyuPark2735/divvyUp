package com.lec.divvyup.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Aboard {
	private int abid;
	private String aid;
	private String abtitle;
	private String abcontent;
	private Date abdate;
	private String abip;
	private int qbid;
}
