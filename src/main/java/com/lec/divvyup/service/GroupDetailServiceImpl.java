package com.lec.divvyup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.GroupDetailDao;
import com.lec.divvyup.vo.EventDetail;
import com.lec.divvyup.vo.GroupDetail;

@Service
public class GroupDetailServiceImpl implements GroupDetailService {
@Autowired
private GroupDetailDao groupDetailDao;
	@Override
	public int insertGroupDetail(String[] mids) {
		for(int i=0; i < mids.length ; i++) {
			 System.out.println(mids[i]);
			 String mid= mids[i];
			 groupDetailDao.insertGroupDetail(mid); 
			 }
		return 1;
	}
	@Override
	public int insertGroupDetail(String mid) {
		return groupDetailDao.insertGroupDetail(mid);
	}
	@Override
	public List<GroupDetail> groupDetailList(int gid) {
		return groupDetailDao.groupDetailList(gid);
	}
	@Override
	public int updateGroupDetail(int gid) {
		return groupDetailDao.updateGroupDetail(gid);
	}
	@Override
	public int updateBalance(String mid) {
		return groupDetailDao.updateBalance(mid);
	}
	/*
	 * @Override public int updateGroupDetailPayer(int gid, String mid) {
	 * GroupDetail groupDetail = new GroupDetail(); groupDetail.setGid(gid);
	 * System.out.println(gid); groupDetail.setMid(mid); System.out.println(mid);
	 * groupDetailDao.updateGroupDetail(groupDetail); return 1; }
	 */
}