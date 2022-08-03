package com.lec.divvyup.service;

import java.util.List;

import com.lec.divvyup.vo.GroupDetail;


public interface GroupDetailService {
	public int insertGroupDetail(GroupDetail groupDetail);
	public List<GroupDetail> groupDetailList(int gid);
	public int updateGroupDetail();
}
