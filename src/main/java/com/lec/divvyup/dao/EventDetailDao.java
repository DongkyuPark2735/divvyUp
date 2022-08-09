package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.EventDetail;
import com.lec.divvyup.vo.GroupDetail;

@Mapper
public interface EventDetailDao {
	public int insertEventDetail(String mid);
	public int insertEventDetail2(EventDetail eventDetail);
	public int insertEventDetailPayer(String mid);
	public int insertEventDetailPayer2(String mid);
	public List<Event> printMidList(int gid);
	public int deleteEventDetail();
	public int step4BeforeDeleteGroup(int gid);
}
