package com.lec.unie.dao;

import java.util.List;

import com.lec.unie.dto.Book;
import com.lec.unie.dto.Groups;

public interface GroupsDao {
	public List<Groups> groupList();
	public Groups groupInfo(int gid);
}
