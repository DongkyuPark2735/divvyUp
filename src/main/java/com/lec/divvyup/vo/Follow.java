package com.lec.divvyup.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Follow {
	private int fid;
	private String from_mid;
	private String to_mid;
}
