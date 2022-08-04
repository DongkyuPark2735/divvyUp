package com.lec.divvyup.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.AboardDao;
import com.lec.divvyup.dao.QboardDao;
import com.lec.divvyup.vo.Aboard;
@Service
public class AboardServiceImpl implements AboardService {
	@Autowired
	private QboardDao qboardDao;
	@Autowired
	private AboardDao aboardDao;
	
	@Override
	public int writeAboard(Aboard aboard, HttpServletRequest request) {
		// TODO Auto-generated method stub
		aboard.setAbip(request.getRemoteAddr());
		qboardDao.updateQboardReplyCheck(aboard.getQbid());
		return aboardDao.writeAboard(aboard);
	}

	@Override
	public int modifyAboard(Aboard aboard, HttpServletRequest request) {
		// TODO Auto-generated method stub
		aboard.setAbip(request.getRemoteAddr());
		int result = aboardDao.modifyAboard(aboard);
		System.out.println(result==1 ? "성공"+aboard:"실패:"+aboard);
		return result;
	}

	@Override
	public Aboard viewAboard(int qbid) {
		// TODO Auto-generated method stub
		return aboardDao.viewAboard(qbid);
	}

	@Override
	public int deleteAboard(int abid) {
		// TODO Auto-generated method stub
		return aboardDao.deleteAboard(abid);
	}

}
