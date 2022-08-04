package com.lec.divvyup.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.lec.divvyup.vo.Qboard;

public interface QboardService {
	public int writeQboard(Qboard qboard, HttpServletRequest request);
	public int modifyQboard(Qboard qboard, HttpServletRequest request);
	public Qboard viewQboard(int qbid);
	public List<Qboard> listQboardForMember(String pageNum);
	public int getQboardTotCntForMember();
	public List<Qboard> listQboardForMe(String mid, String pageNum);
	public int getQboardTotCntForMe(String mid);
	public List<Qboard> listUncheckedQboardForAdmin(String pageNum);
	public int getUncheckedQboardTotCntForAdmin();
	public List<Qboard> listCheckedQboardForAdmin(String pageNum);
	public int getCheckedQboardTotCntForAdmin();
	public int deleteQboard(int qbid);
}
