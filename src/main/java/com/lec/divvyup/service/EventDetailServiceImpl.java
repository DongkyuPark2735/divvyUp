package com.lec.divvyup.service;

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

import com.lec.divvyup.dao.EventDetailDao;
import com.lec.divvyup.vo.Event;
import com.lec.divvyup.vo.EventDetail;
import com.lec.divvyup.vo.GroupDetail;

@Service
public class EventDetailServiceImpl implements EventDetailService {
	@Autowired
	private EventDetailDao eventDetailDao;
	@Override
	public int insertEventDetail(String[] mids) {
		
		 for(int i=0; i < mids.length ; i++) {
			 System.out.println(mids[i]);
			 String mid= mids[i];
			 eventDetailDao.insertEventDetail(mid); 
			 }
		return 1;
	}
	@Override
	public int insertEventDetail2(String[] mids, int[] share) {
		
		 for(int i=0; i < mids.length ; i++) {
			 System.out.println(mids[i]);
				/* String mid = mids[i]; */
			 System.out.println(share[i]); 
				/* int edshare = share[i]; */
			 eventDetailDao.insertEventDetail2(mids[1], share[1]); 
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

}

