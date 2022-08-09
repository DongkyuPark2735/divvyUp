package com.lec.divvyup.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.vo.Groups;
import com.lec.divvyup.vo.Member;



public interface GroupsService {
	public List<Groups> groupList();
	public Groups groupInfo(int gid);
	public int nextGid();
	public List<Member> memberList();
	public int groupInsert(Groups group, MultipartHttpServletRequest mRequest);
	}
