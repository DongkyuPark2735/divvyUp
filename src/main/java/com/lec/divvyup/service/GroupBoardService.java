package com.lec.divvyup.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.vo.GroupBoard;

public interface GroupBoardService {
	public void insertGroupboard(GroupBoard groupBoard, MultipartHttpServletRequest mRequest);
	public int deleteGroupboard(int gbid);
	public List<GroupBoard> listLatest20Groupboard(int gid ,HttpSession session);
	public List<GroupBoard> listPast20Groupboard(GroupBoard groupBoard);
	public GroupBoard singleLatestGroupboard(int gid);
	public GroupBoard getGroupboardVO(String mid);
}
