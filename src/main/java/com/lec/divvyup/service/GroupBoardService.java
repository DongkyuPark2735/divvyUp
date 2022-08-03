package com.lec.divvyup.service;

import java.util.List;

import com.lec.divvyup.vo.GroupBoard;

public interface GroupBoardService {
	public GroupBoard insertGroupboard(GroupBoard groupBoard);
	public int deleteGroupboard(int gbid);
	public List<GroupBoard> listLatest20Groupboard(int gid);
	public List<GroupBoard> listPast20Groupboard(GroupBoard groupBoard);
	public GroupBoard singleLatestGroupboard(int gid);
	public GroupBoard getGroupboardVO(String mid);
}
