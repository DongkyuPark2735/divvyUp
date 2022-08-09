package com.lec.divvyup.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lec.divvyup.vo.GroupDetail;


public interface GroupDetailService {
	public int insertGroupDetail(String[] fids);
	public int insertGroupDetail(String mid);
	public List<GroupDetail> groupDetailList(int gid);
	public int updateGroupDetail(int gid);
	public int updateBalance(String mid);
	public int insertGroupDetailNew(String[] fids, int gid);
	public int deleteMember(String mid, int gid);
	public int rollbackEventInfo(@Param("eid")int eid, @Param("gid")int gid);
	public int step2BeforeDeleteGroup(int gid);

}
