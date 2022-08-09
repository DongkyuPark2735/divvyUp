package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.lec.divvyup.vo.GroupDetail;

@Mapper
public interface GroupDetailDao {
	public int insertGroupDetail(String mid);
	public int updateGroupDetail(int gid);
	public List<GroupDetail> groupDetailList(int gid);
	public int updateBalance(String mid);
	public int groupCheckMemberExist(GroupDetail groupDetail);
	public int insertGroupDetailNew(GroupDetail groupDetail);
	public int deleteMember(GroupDetail groupDetail);
	public int rollbackEventInfo(@Param("eid")int eid, @Param("gid")int gid);
	public int step2BeforeDeleteGroup(int gid);
}