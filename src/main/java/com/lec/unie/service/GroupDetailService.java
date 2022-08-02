package com.lec.unie.service;

import java.util.List;

import com.lec.unie.dto.GroupDetail;

public interface GroupDetailService {
	public int insertGroupDetail(GroupDetail groupDetail);
	public int updateGroupDetail(GroupDetail groupDetail);
	public List<GroupDetail> groupDetailList(int gid);
}
