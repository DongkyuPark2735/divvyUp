package com.lec.unie.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventDetail {
	private int edid;
	private int eid;
	private String mid;
	private int edshare;
}
