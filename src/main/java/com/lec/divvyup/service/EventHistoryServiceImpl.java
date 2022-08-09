package com.lec.divvyup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.EventHistoryDao;
import com.lec.divvyup.vo.EventHistory;

@Service
public class EventHistoryServiceImpl implements EventHistoryService {
	@Autowired
	private EventHistoryDao eventHistoryDao;
	@Override
	public int insertEventHistory() {
		return eventHistoryDao.insertEventHistory();
	}
	@Override
	public List<EventHistory> getEventHistory(int eid) {
		return eventHistoryDao.getEventHistory(eid);
	}
	@Override
	public int deleteEventHistory(int eid) {
		return eventHistoryDao.deleteEventHistory(eid);
	}
	@Override
	public int step3BeforeDeleteGroup(int gid) {
		if (eventHistoryDao.step3BeforeDeleteGroup(gid) == 1) {
			return 1;
		} else {
			return 0;
		}
	}

}
