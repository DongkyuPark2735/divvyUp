package com.lec.divvyup.service;

import java.util.List;

import com.lec.divvyup.vo.GroupBoard;

public interface GroupBoardService {
<<<<<<< HEAD
	public GroupBoard insertGroupboard(GroupBoard groupBoard);
=======
	public int insertGroupboard(GroupBoard groupBoard);
>>>>>>> 1cdd6702cab83b23a214fd9ec8601e97792e39dd
	public int deleteGroupboard(int gbid);
	public List<GroupBoard> listLatest20Groupboard(int gid);
	public List<GroupBoard> listPast20Groupboard(GroupBoard groupBoard);
	public GroupBoard singleLatestGroupboard(int gid);
<<<<<<< HEAD
	public GroupBoard getGroupboardVO(String mid);
=======
>>>>>>> 1cdd6702cab83b23a214fd9ec8601e97792e39dd
}
