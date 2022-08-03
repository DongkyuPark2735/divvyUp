package com.lec.divvyup.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupBoard {
	private int gbid;
	private int gid;
	private String mid;
	private String gbcontent;
	private String gbfilename;
	private Timestamp gbrdate;
	private int startRow;
	private int endRow;
	
	public GroupBoard(int gbid, int gid, String mid, String gbcontent, String gbfilename, Timestamp gbrdate) {
		super();
		this.gbid = gbid;
		this.gid = gid;
		this.mid = mid;
		this.gbcontent = gbcontent;
		this.gbfilename = gbfilename;
		this.gbrdate = gbrdate;
	};
}
