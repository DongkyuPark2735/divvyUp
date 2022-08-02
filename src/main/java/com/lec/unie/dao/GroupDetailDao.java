package com.lec.unie.dao;

import java.util.List;

import com.lec.unie.dto.GroupDetail;

public interface GroupDetailDao {
	public int insertGroupDetail(GroupDetail groupDetail);
	public int updateGroupDetail(GroupDetail groupDetail);
	public List<GroupDetail> groupDetailList(int gid);
}