package com.lec.divvyup.service;

import javax.servlet.http.HttpSession;

import com.lec.divvyup.vo.Admin;

public interface AdminService {
	public String aloginCheck(String aid, String apw, HttpSession session);
	public Admin getAdmin(String aid);
}
