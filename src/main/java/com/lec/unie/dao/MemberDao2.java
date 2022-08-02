package com.lec.unie.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.unie.dto.Member2;

@Mapper
public interface MemberDao2 {
	public int idConfirm(String mid);
	public int joinMember(Member2 member);
	public Member2 getDetailMember(String mid);
	public int modifyMember(Member2 member);
}