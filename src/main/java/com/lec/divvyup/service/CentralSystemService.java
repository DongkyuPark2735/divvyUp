package com.lec.divvyup.service;

import javax.servlet.http.HttpSession;

import com.lec.divvyup.vo.Member;

public interface CentralSystemService {
	public int insertSplit(int gid);
	public int totalSum(int gid);
	public int checkAddition(int gid);
	public Member getMember(String mid);
	public int pay(String mid, int gid);
	public int allPayChk();
	public int get(String mid, int gid, HttpSession session);
	public int checkAllPaid(int gid);
	public int finishedSplit(int gid);
	public int checkFinishSplit(int gid);
	public int step6BeforeDeleteGroup(int gid);
}
