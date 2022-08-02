package com.lec.unie.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor 
public class Member2 {
	private String mid;
	private String mpw;
	private String mname;
	private String memail;
	private Date mrdate;
}
