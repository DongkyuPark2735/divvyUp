package com.lec.unie.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lec.unie.dto.Event;
import com.lec.unie.dto.EventDetail;

public interface EventDetailDao {
	public String insertEventDetail(EventDetail eventDetail, HttpServletRequest request, String mid, Model model);
	public List<Event> printMidList(int gid);
}
