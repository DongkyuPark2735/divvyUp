package com.lec.divvyup.service;

import java.util.List;

import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.EventDetail;


public interface EventDetailService {
	public int insertEventDetail(String[] mids);
	public int insertEventDetail2(String[] mids, int[] share);
	public int insertEventDetailPayer(String mid);
	public int insertEventDetailPayer2(String mid);
	public List<Event> printMidList(int gid);
	public int deleteEventDetail();
	public int step4BeforeDeleteGroup(int gid);
}
