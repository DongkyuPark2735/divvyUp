package com.lec.divvyup.service;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.dao.EventDao;
import com.lec.divvyup.vo.Event;

@Service
public class EventServiceImpl implements EventService {
@Autowired
private EventDao eventDao;
	@Override
	public int insertEvent(Event event, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("bookImgFileUpload/");
		String backupPath = "C:\\Users\\Unie\\Documents\\webPro\\webPro\\DivvyUp\\Source\\unie\\src\\main\\webapp\\bookImgFileUpload\\";
		Iterator<String> params = mRequest.getFileNames(); // tempBimg1, tempBimg2
		String[] eimage = new String[1];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
			eimage[idx] = mFile.getOriginalFilename(); 
			if(eimage[idx]!=null && !eimage[idx].equals("")) { // 첨부함
				if(new File(uploadPath + eimage[idx]).exists()) {
					// 서버에 같은 파일이름이 있을 경우(첨부파일과)
					eimage[idx] = System.currentTimeMillis() + "_" + eimage[idx];
				}//if
				try {
					mFile.transferTo(new File(uploadPath + eimage[idx])); // 서버에 저장
					System.out.println("서버파일 : " + uploadPath + eimage[idx]);
					System.out.println("백업파일 : " + backupPath + eimage[idx]);
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
			}
			idx++;
		}
		event.setEimage(eimage[0]); // 첫번째 첨부한 파일 이름
		return eventDao.insertEvent(event); // DB insert
	}
	@Override
	public List<Event> eventList(int gid) {
		return eventDao.eventList(gid);
	}

	}

