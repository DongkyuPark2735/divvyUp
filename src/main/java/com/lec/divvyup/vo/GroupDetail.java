package com.lec.divvyup.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GroupDetail {
	private int gdid;
	private int gid;
	private String mid;
	private int gdbalance;
	private Date gdrdate;
}
