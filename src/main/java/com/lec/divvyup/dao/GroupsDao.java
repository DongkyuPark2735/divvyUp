package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Groups;

@Mapper
public interface GroupsDao {
	public List<Groups> groupList();
	public Groups groupInfo(int gid);
}
