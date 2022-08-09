package com.lec.divvyup.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Member;

@Mapper
public interface CentralSystemDao {
	public int insertSplit(int gid);
	public int checkAddition(int gid);
	public int pay(String mid);
	public int allPayChk(int gid);
}
