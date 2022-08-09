package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.EventHistory;

@Mapper
public interface EventHistoryDao {
	public int insertEventHistory();
	public List<EventHistory> getEventHistory(int eid);
	public int deleteEventHistory(int eid);
	public int step3BeforeDeleteGroup(int gid);
}

