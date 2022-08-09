package com.lec.divvyup.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.GroupDetail;

@Mapper
public interface CentralSystemDao {
	public int insertSplit(int gid);
	public int totalSum(int gid);
	public int checkAddition(int gid);
	public int pay(GroupDetail groupDetail);
	public int allPayChk();
	public int checkAllPaid(int gid);
	public int get(GroupDetail groupDetail);
	public int finishedSplit(int gid);
	public int checkFinishSplit(int gid);
	public int step6BeforeDeleteGroup(int gid);
}
