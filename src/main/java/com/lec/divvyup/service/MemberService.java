package com.lec.divvyup.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lec.divvyup.vo.Member;

public interface MemberService {
	public Member loginMember(String mid);
	public int confirmMid(String mid);
	public int confirmMemail(String memail);
	public int joinMember(Member member, HttpSession session);
	public String loginCheck(String mid, String mpw, HttpSession session); // MemberServiceImpl에서 getMember() 호출!
	public Member getMember(String mid);
	public int modifyMember(Member member);
	public String searchMid(String mname, String memail);
	public String searchMpw(String mid, String mname, String memail);
	public List<Member> memberListForGroupBoard(); 
}
