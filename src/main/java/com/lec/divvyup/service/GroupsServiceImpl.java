package com.lec.divvyup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.dao.GroupsDao;
import com.lec.divvyup.vo.Groups;

@Service
public class GroupsServiceImpl implements GroupsService {

@Autowired
private GroupsDao groupsDao;
	@Override
	public Groups groupInfo(int gid) {
		return groupsDao.groupInfo(gid);
	}
	@Override
	public List<Groups> groupList() {
		return groupsDao.groupList();
	}

}
