package com.lec.unie.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.unie.dto.Event;
import com.lec.unie.dto.EventDetail;

public interface EventDetailService {
	public String insertEventDetail(EventDetail eventDetail, HttpServletRequest request, String mid, Model model);
	public List<Event> printMidList(int gid);
}
