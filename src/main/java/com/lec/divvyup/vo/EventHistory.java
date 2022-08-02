package com.lec.divvyup.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventHistory {
	private int ehid;
	private int eid;
	private String mid;
	private int edshare;
	private Date erdate;
	private String ename;
}
