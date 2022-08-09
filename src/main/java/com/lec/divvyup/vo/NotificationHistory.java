package com.lec.divvyup.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class NotificationHistory {
	private int nothid;
	private String notsender;
	private String notreceiver;
	private String notcontent;
	private Date notdate;
	private int notkind;
	private int notcheck;
	private int startRow;
	private int endRow;
}
