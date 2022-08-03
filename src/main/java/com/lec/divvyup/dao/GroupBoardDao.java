package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.GroupBoard;

@Mapper
public interface GroupBoardDao {
	public int insertGroupboard(GroupBoard groupBoard);
	public int deleteGroupboard(int gbid);
	public List<GroupBoard> listLatest20Groupboard(int gid);
	public List<GroupBoard> listPast20Groupboard(GroupBoard groupBoard);
	public GroupBoard singleLatestGroupboard(int gid);
<<<<<<< HEAD
	public GroupBoard getGroupboardVO(String mid);
=======
>>>>>>> 1cdd6702cab83b23a214fd9ec8601e97792e39dd
}
