package com.lec.divvyup.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.CentralSystemDao;
import com.lec.divvyup.dao.MemberDao;
import com.lec.divvyup.vo.GroupDetail;
import com.lec.divvyup.vo.Member;
@Service
public class CentralSystemServiceImpl implements CentralSystemService {
	@Autowired
	private CentralSystemDao centralSystemDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private JavaMailSender mailSender;
	@Override
	public int insertSplit(int gid) {
		if (centralSystemDao.checkAddition(gid) == 0) {
			return centralSystemDao.insertSplit(gid); 
		} else {
			return 0;
		}
	}
	@Override
	public int totalSum(int gid) {
		return centralSystemDao.totalSum(gid);
	}
	@Override
	public int checkAddition(int gid) {
		return centralSystemDao.checkAddition(gid);
	}
	@Override
	public Member getMember(String mid) {
		return memberDao.getMember(mid);
	}
	@Override
	public int pay(String mid, int gid) {
		GroupDetail groupDetail = new GroupDetail();
		groupDetail.setMid(mid);
		groupDetail.setGid(gid);
		centralSystemDao.pay(groupDetail);
			return 1;
	}
	@Override
	public int allPayChk() {
		return centralSystemDao.allPayChk();
	}
	@Override
	public int get(String mid, int gid, final HttpSession session) {
			GroupDetail groupDetail = new GroupDetail();
			groupDetail.setMid(mid);
			groupDetail.setGid(gid);
			centralSystemDao.get(groupDetail);
		return 1;
	}
	@Override
	public int checkAllPaid(int gid) {
		return centralSystemDao.checkAllPaid(gid);
	}
	@Override
	public int finishedSplit(int gid) {
		return centralSystemDao.finishedSplit(gid);
	}
	@Override
	public int checkFinishSplit(int gid) {
		if(centralSystemDao.checkFinishSplit(gid) == 1) {
			return 1;
		} else {
			return 0;			
		}
	}
	@Override
	public int step6BeforeDeleteGroup(int gid) {
		if (centralSystemDao.step6BeforeDeleteGroup(gid) == 1) {
			return 1;
		} else {
			return 0;
		}
	}
}
