package com.lec.unie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.unie.dao.GroupsDao;
import com.lec.unie.dto.Groups;
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
