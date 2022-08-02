package com.lec.unie.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.unie.dto.Groups;


public interface GroupsService {
	public List<Groups> groupList();
	public Groups groupInfo(int gid);
	}
