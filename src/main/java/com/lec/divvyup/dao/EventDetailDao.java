package com.lec.divvyup.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.EventDetail;
import com.lec.divvyup.vo.GroupDetail;

@Mapper
public interface EventDetailDao {
	public int insertEventDetail(String mid);
	public int insertEventDetail2(String mid, int edshare);
	public int insertEventDetailPayer(String mid);
	public int insertEventDetailPayer2(String mid);
	public List<Event> printMidList(int gid);
	public int deleteEventDetail();
}
