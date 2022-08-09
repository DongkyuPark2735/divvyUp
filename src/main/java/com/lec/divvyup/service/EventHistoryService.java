package com.lec.divvyup.service;

import java.util.List;

import com.lec.divvyup.vo.EventHistory;

public interface EventHistoryService {
	public int insertEventHistory();
	public List<EventHistory> getEventHistory(int eid);
	public int deleteEventHistory(int eid);
	public int step3BeforeDeleteGroup(int gid);
}
