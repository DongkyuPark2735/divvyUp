package com.lec.divvyup.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String mid;
	private String mpw;
	private String mname;
	private String memail;
	private Date mrdate;
}
