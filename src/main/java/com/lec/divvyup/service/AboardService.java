package com.lec.divvyup.service;

import javax.servlet.http.HttpServletRequest;

import com.lec.divvyup.vo.Aboard;

public interface AboardService {
	public int writeAboard(Aboard aboard, HttpServletRequest request);
	public int modifyAboard(Aboard aboard, HttpServletRequest request);
	public Aboard viewAboard(int qbid);
	public int deleteAboard(int abid);
	
}
