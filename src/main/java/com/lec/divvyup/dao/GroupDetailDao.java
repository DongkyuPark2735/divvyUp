package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.EventDetail;
import com.lec.divvyup.vo.GroupDetail;

@Mapper
public interface GroupDetailDao {
	public int insertGroupDetail(GroupDetail groupDetail);
	public int updateGroupDetail(GroupDetail groupDetail);
	public List<GroupDetail> groupDetailList(int gid);
	public int updateGroupDetail();
}