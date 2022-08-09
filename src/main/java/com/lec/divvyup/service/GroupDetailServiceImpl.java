package com.lec.divvyup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.GroupDetailDao;
import com.lec.divvyup.vo.GroupDetail;

@Service
public class GroupDetailServiceImpl implements GroupDetailService {
@Autowired
private GroupDetailDao groupDetailDao;
	@Override
	public int insertGroupDetail(String[] fids) {
		for(int i=0; i < fids.length ; i++) {
			 String mid= fids[i];
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
	@Override
	public int insertGroupDetailNew(String[] fids, int gid) {
		GroupDetail groupDetail = new GroupDetail();
		for(int i=0; i < fids.length ; i++) {
			 String mid= fids[i];
			 groupDetail.setGid(gid);
			 groupDetail.setMid(mid);
			 if(groupDetailDao.groupCheckMemberExist(groupDetail) == 1) { //if the member already exists

			 } else {
				 groupDetailDao.insertGroupDetailNew(groupDetail); 
			 }
			 
			 }
		return 1;
	}
	@Override
	public int deleteMember(String mid, int gid) {
		GroupDetail groupDetail = new GroupDetail();
		groupDetail.setGid(gid);
		groupDetail.setMid(mid);
		if (groupDetailDao.deleteMember(groupDetail) == 1) {
			return 1;
		} else {
			return 0;
		}
	}
	@Override
	public int rollbackEventInfo(int eid, int gid) {
		return groupDetailDao.rollbackEventInfo(eid, gid);
	}
	@Override
	public int step2BeforeDeleteGroup(int gid) {
		if (groupDetailDao.step2BeforeDeleteGroup(gid) == 1) {
			return 1;
		} else {
			return 0;
		}
	}
}