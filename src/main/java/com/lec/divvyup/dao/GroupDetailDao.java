package com.lec.divvyup.dao;

import java.util.List;

import com.lec.divvyup.vo.GroupDetail;


public interface GroupDetailDao {
	public int insertGroupDetail(GroupDetail groupDetail);
	public int updateGroupDetail(GroupDetail groupDetail);
	public List<GroupDetail> groupDetailList(int gid);
}