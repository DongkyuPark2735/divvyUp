package com.lec.unie.dto;

import lombok.AllArgsConstructor;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CentralSystem {
	private int csid;
	private int csamount;
	private int csallpaid;
	private int gid;
}
