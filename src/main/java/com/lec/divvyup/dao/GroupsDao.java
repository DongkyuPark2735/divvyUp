package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.Groups;
import com.lec.divvyup.vo.Member;

@Mapper
public interface GroupsDao {
	public List<Groups> groupList();
	public Groups groupInfo(int gid);
	public int nextGid();
	public List<Member> memberList();
	public int groupInsert(Groups group);
}
