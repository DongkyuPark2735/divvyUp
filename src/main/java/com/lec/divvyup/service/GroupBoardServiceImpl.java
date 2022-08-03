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
	public GroupBoard insertGroupboard(GroupBoard groupBoard) {
		GroupBoard gb = new GroupBoard();
		if(groupBoardDao.insertGroupboard(groupBoard) == 1) {
			gb = groupBoardDao.getGroupboardVO(groupBoard.getMid());
		};
		return gb;
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
		List<GroupBoard> pastGList = groupBoardDao.listPast20Groupboard(groupBoard);
		return pastGList;
	}

	@Override
	public GroupBoard singleLatestGroupboard(int gid) {
		GroupBoard gbBoarad = groupBoardDao.singleLatestGroupboard(gid);
		return gbBoarad;
	}

	@Override
	public GroupBoard getGroupboardVO(String mid) {
		return null;
	}

}
