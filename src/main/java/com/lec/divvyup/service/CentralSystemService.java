package com.lec.divvyup.service;

import com.lec.divvyup.vo.Member;

public interface CentralSystemService {
	public int insertSplit(int gid);
	public int checkAddition(int gid);
	public Member getMember(String mid);
	public int pay(String mid);
	public int allPayChk(int gid);
}
