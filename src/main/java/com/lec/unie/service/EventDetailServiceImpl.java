package com.lec.unie.service;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.unie.dao.EventDao;
import com.lec.unie.dao.EventDetailDao;
import com.lec.unie.dto.Book;
import com.lec.unie.dto.Event;
import com.lec.unie.dto.EventDetail;
@Service

public class EventDetailServiceImpl implements EventDetailService {
@Autowired
private EventDetailDao eventDetailDao;
	@Override
	public String insertEventDetail(EventDetail eventDetail, HttpServletRequest request, String mid, Model model) {

		String[] mids = request.getParameterValues("mids");
		for(int i=0; i < mids.length ; i++) {
			mid = mids[i];
			return eventDetailDao.insertEventDetail(eventDetail, request, mid, model);
		}
		return null;
	}
	
	@Override
	public List<Event> printMidList(int gid) {
		return eventDetailDao.printMidList(gid);
	}

	}

