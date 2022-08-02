package com.lec.unie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.unie.dao.GroupDetailDao;
import com.lec.unie.dto.GroupDetail;
@Service
public class GroupDetailServiceImpl implements GroupDetailService {
@Autowired
private GroupDetailDao groupDetailDao;
	@Override
	public int insertGroupDetail(GroupDetail groupDetail) {
		return groupDetailDao.insertGroupDetail(groupDetail);
	}

	@Override
	public int updateGroupDetail(GroupDetail groupDetail) {
		return groupDetailDao.updateGroupDetail(groupDetail);
	}

	@Override
	public List<GroupDetail> groupDetailList(int gid) {
		return groupDetailDao.groupDetailList(gid);
	}


}
