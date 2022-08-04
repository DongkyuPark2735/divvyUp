package com.lec.divvyup.service;

import java.util.List;

import com.lec.divvyup.vo.GroupDetail;


public interface GroupDetailService {
	public int insertGroupDetail(String[] mids);
	public int insertGroupDetail(String mid);
	public List<GroupDetail> groupDetailList(int gid);
	public int updateGroupDetail();
	
	
	
	
	
}
