package com.lec.divvyup.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Groups {
	private int gid;
	private String gname;
	private Date grdate;
	private String gimg;
	private String gcontent;
	private String mid;
	private int startRow;
	private int endRow;
}
