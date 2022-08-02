package com.lec.unie.service;

import javax.servlet.http.HttpSession;

import com.lec.unie.dto.Member2;
public interface MemberService2 {
	public int idConfirm(String mid);
	public int joinMember(Member2 member, HttpSession httpSession);
	public String loginCheck(String mid, String mpw, HttpSession httpSession);
	public Member2 getDetailMember(String mid);
	public int modifyMember(Member2 member);
}