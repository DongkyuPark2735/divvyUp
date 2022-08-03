package com.lec.divvyup.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.EventDetail;


public interface EventDetailService {
	public int insertEventDetail(String[] mids);
	public int insertEventDetailPayer(String mid);
	public List<Event> printMidList(int gid);
	public int deleteEventDetail();
}
