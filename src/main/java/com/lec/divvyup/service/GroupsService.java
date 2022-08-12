package com.lec.divvyup.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.vo.Groups;
import com.lec.divvyup.vo.Member;



public interface GroupsService {
	public List<Groups> groupList(String mid);
	public Groups groupInfo(int gid);
	public int nextGid();
	public List<Member> followList(String mid);
	public int groupInsert(Groups group, MultipartHttpServletRequest mRequest);
	public int modify(MultipartHttpServletRequest mRequest, Groups groups);
	public int finalStepDeleteGroup(int gid);	
	public List<Groups> groupListforAdminSearch(String mid);
}
