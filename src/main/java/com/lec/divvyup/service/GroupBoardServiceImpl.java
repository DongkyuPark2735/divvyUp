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
	public int insertGroupboard(GroupBoard groupBoard) {
		// TODO Auto-generated method stub
		return 0;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GroupBoard singleLatestGroupboard(int gid) {
		// TODO Auto-generated method stub
		return null;
	}

}
