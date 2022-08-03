package com.lec.divvyup.dao;

import java.util.List;

import com.lec.divvyup.vo.Groups;


public interface GroupsDao {
	public List<Groups> groupList();
	public Groups groupInfo(int gid);
}
