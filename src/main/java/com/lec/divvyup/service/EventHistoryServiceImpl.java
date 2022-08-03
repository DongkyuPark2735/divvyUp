package com.lec.divvyup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.EventHistoryDao;

@Service
public class EventHistoryServiceImpl implements EventHistoryService {
	@Autowired
	private EventHistoryDao eventHistoryDao;
	@Override
	public int insertEventHistory() {
		return eventHistoryDao.insertEventHistory();
	}

}
