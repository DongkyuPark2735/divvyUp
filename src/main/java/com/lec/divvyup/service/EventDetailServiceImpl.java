package com.lec.divvyup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.EventDetailDao;
import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.EventDetail;

@Service
public class EventDetailServiceImpl implements EventDetailService {
	@Autowired
	private EventDetailDao eventDetailDao;
	@Override
	public int insertEventDetail(String[] mids) {
		 for(int i=0; i < mids.length ; i++) {
			 String mid= mids[i];
			 eventDetailDao.insertEventDetail(mid); 
			 }
		return 1;
	}
	@Override
	public int insertEventDetail2(String[] mids, int[] share) {
		 for(int i=0; i < mids.length ; i++) {
			 EventDetail eventDetail = new EventDetail();
			 if(share[i]!=0) {
					eventDetail.setMid(mids[i]);
					eventDetail.setEdshare(share[i]);
					eventDetailDao.insertEventDetail2(eventDetail); 
			 } else if  (share[i]==0) {
					eventDetail.setMid(mids[i]);
					eventDetail.setEdshare(0);
					eventDetailDao.insertEventDetail2(eventDetail); 
			 }
			 }
		return 1;
	}
	@Override
	public int insertEventDetailPayer(String mid) {
		return eventDetailDao.insertEventDetailPayer(mid); 
	}
	@Override
	public int insertEventDetailPayer2(String mid) {
		System.out.println(mid);
		return eventDetailDao.insertEventDetailPayer2(mid); 
	}
	
	@Override
	public List<Event> printMidList(int gid) {
		return eventDetailDao.printMidList(gid);
	}
	@Override
	public int deleteEventDetail() {
		return eventDetailDao.deleteEventDetail();
	}
	@Override
	public int step4BeforeDeleteGroup(int gid) {
		if (eventDetailDao.step4BeforeDeleteGroup(gid) == 1) {
			return 1;
		} else {
			return 0;
		}
	}

}

