package com.lec.divvyup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.CentralSystemDao;
import com.lec.divvyup.dao.MemberDao;
import com.lec.divvyup.vo.Member;
@Service
public class CentralSystemServiceImpl implements CentralSystemService {
	@Autowired
	private CentralSystemDao centralSystemDao;
	@Autowired
	private MemberDao memberDao;
	@Override
	public int insertSplit(int gid) {
		if (centralSystemDao.checkAddition(gid)== 0) {
			return centralSystemDao.insertSplit(gid); 
		} else {
			return 0;
		}
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
	public int pay(String mid) {
		return centralSystemDao.pay(mid);
	}
	@Override
	public int allPayChk(int gid) {
		return centralSystemDao.allPayChk(gid);
	}
}
