package com.lec.divvyup.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.EventDetail;
import com.lec.divvyup.vo.GroupDetail;


public interface EventDetailService {
	public int insertEventDetail(String[] mids);
	public int insertEventDetail2(String[] mids, int[] share);
	public int insertEventDetailPayer(String mid);
	public int insertEventDetailPayer2(String mid);
	public List<Event> printMidList(int gid);
	public int deleteEventDetail();
}
