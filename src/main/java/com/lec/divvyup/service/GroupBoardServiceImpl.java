package com.lec.divvyup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.GroupBoardDao;
import com.lec.divvyup.vo.GroupBoard;

@Service
public class GroupBoardServiceImpl implements GroupBoardService {

	@Autowired
	private GroupBoardDao groupBoardDao; 
	
	@Override
<<<<<<< HEAD
	public GroupBoard insertGroupboard(GroupBoard groupBoard) {
		GroupBoard gb = new GroupBoard();
		if(groupBoardDao.insertGroupboard(groupBoard) == 1) {
			gb = groupBoardDao.getGroupboardVO(groupBoard.getMid());
		};
		return gb;
=======
	public int insertGroupboard(GroupBoard groupBoard) {
		// TODO Auto-generated method stub
		return 0;
>>>>>>> 1cdd6702cab83b23a214fd9ec8601e97792e39dd
	}

	@Override
	public int deleteGroupboard(int gbid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GroupBoard> listLatest20Groupboard(int gid) {
		List<GroupBoard> glist = groupBoardDao.listLatest20Groupboard(gid);
		return glist;
	}

	@Override
	public List<GroupBoard> listPast20Groupboard(GroupBoard groupBoard) {
<<<<<<< HEAD
		List<GroupBoard> pastGList = groupBoardDao.listPast20Groupboard(groupBoard);
		return pastGList;
=======
		// TODO Auto-generated method stub
		return null;
>>>>>>> 1cdd6702cab83b23a214fd9ec8601e97792e39dd
	}

	@Override
	public GroupBoard singleLatestGroupboard(int gid) {
<<<<<<< HEAD
		GroupBoard gbBoarad = groupBoardDao.singleLatestGroupboard(gid);
		return gbBoarad;
	}

	@Override
	public GroupBoard getGroupboardVO(String mid) {
=======
		// TODO Auto-generated method stub
>>>>>>> 1cdd6702cab83b23a214fd9ec8601e97792e39dd
		return null;
	}

}
