package com.lec.divvyup.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.AboardDao;
import com.lec.divvyup.dao.QboardDao;
import com.lec.divvyup.util.Paging;
import com.lec.divvyup.vo.Qboard;
@Service
public class QboardServiceImpl implements QboardService {
	Qboard qboard = new Qboard();
	
	@Autowired
	private QboardDao qboardDao;
	
	@Override
	public int writeQboard(Qboard qboard, HttpServletRequest request) {
		// TODO Auto-generated method stub
		qboard.setQbip(request.getRemoteAddr());
		return qboardDao.writeQboard(qboard);
	}

	@Override
	public int modifyQboard(Qboard qboard, HttpServletRequest request) {
		// TODO Auto-generated method stub
		qboard.setQbip(request.getRemoteAddr());
		return qboardDao.modifyQboard(qboard);
	}

	@Override
	public Qboard viewQboard(int qbid) {
		// TODO Auto-generated method stub
		return qboardDao.viewQboard(qbid);
	}

	@Override
	public List<Qboard> listQboardForMember(String pageNum) {
		// TODO Auto-generated method stub
		Paging paging = new Paging(qboardDao.getQboardTotCntForMember(), pageNum);
		qboard.setStartRow(paging.getStartRow());
		qboard.setEndRow(paging.getEndRow());
		return qboardDao.listQboardForMember(qboard);
	}

	@Override
	public int getQboardTotCntForMember() {
		// TODO Auto-generated method stub
		return qboardDao.getQboardTotCntForMember();
	}

	@Override
	public List<Qboard> listQboardForMe(String pageNum) {
		// TODO Auto-generated method stub
		Paging paging = new Paging(qboardDao.getQboardTotCntForMe(), pageNum);
		qboard.setStartRow(paging.getStartRow());
		qboard.setEndRow(paging.getEndRow());
		return qboardDao.listQboardForMe(qboard);
	}

	@Override
	public int getQboardTotCntForMe() {
		// TODO Auto-generated method stub
		return qboardDao.getQboardTotCntForMe();
	}

	@Override
	public List<Qboard> listUncheckedQboardForAdmin(String pageNum) {
		// TODO Auto-generated method stub
		Paging paging = new Paging(qboardDao.getUncheckedQboardTotCntForAdmin(), pageNum);
		qboard.setStartRow(paging.getStartRow());
		qboard.setEndRow(paging.getEndRow());
		return qboardDao.listUncheckedQboardForAdmin(qboard);
	}

	@Override
	public int getUncheckedQboardTotCntForAdmin() {
		// TODO Auto-generated method stub
		return qboardDao.getUncheckedQboardTotCntForAdmin();
	}

	@Override
	public List<Qboard> listCheckedQboardForAdmin(String pageNum) {
		// TODO Auto-generated method stub
		Paging paging = new Paging(qboardDao.getCheckedQboardTotCntForAdmin(), pageNum);
		qboard.setStartRow(paging.getStartRow());
		qboard.setEndRow(paging.getEndRow());
		return qboardDao.listCheckedQboardForAdmin(qboard);
	}

	@Override
	public int getCheckedQboardTotCntForAdmin() {
		// TODO Auto-generated method stub
		return qboardDao.getCheckedQboardTotCntForAdmin();
	}

	@Override
	public int deleteQboard(int qbid) {
		// TODO Auto-generated method stub
		return qboardDao.deleteQboard(qbid);
	}

}
