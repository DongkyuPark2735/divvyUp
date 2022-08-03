package com.lec.divvyup.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Event {
	private int eid;
	private String ename;
	private String econtent;
	private String eimage;
	private int eamount;
	private String eaddress;
	private int ecount;
	private Date erdate;
	private String mid;
	private int gid;
}
