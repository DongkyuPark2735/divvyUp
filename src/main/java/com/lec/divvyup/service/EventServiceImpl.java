package com.lec.divvyup.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
String backupPath = "C:\\Users\\Unie\\Documents\\DivvyUpTeamUnie\\divvyUp\\src\\main\\webapp\\eventImgFileUpload\\";
	@Override
	public int insertEvent(Event event, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("eventImgFileUpload/");
		boolean isUpload = false;
		Iterator<String> params = mRequest.getFileNames(); // tempBimg1, tempBimg2
		String[] eimage = new String[1];
		int idx = 0;
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			eimage[idx] = mFile.getOriginalFilename(); 
			if(eimage[idx]!=null && !eimage[idx].equals("")) {
				if(new File(uploadPath + eimage[idx]).exists()) {
					// If name is pre-existing on server:
					eimage[idx] = System.currentTimeMillis() + "_" + eimage[idx];
				}//if
				try {
					mFile.transferTo(new File(uploadPath+eimage[idx]));
					System.out.println("서버파일 : " + uploadPath + eimage[idx]);
					System.out.println("백업파일 : " + backupPath + eimage[idx]);
					isUpload = filecopy(uploadPath + eimage[idx], backupPath + eimage[idx]);
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
			}
		}
		event.setEimage(eimage[0]);
		return eventDao.insertEvent(event); // DB insert
	}
	private boolean filecopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null; 
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
	@Override
	public List<Event> eventList(int gid) {
		return eventDao.eventList(gid);
	}
	@Override
	public Event getEvent(int eid) {
		return eventDao.getEvent(eid);
	}
	@Override
	public int modifyEvent(MultipartHttpServletRequest mRequest, Event event) {
		String uploadPath = mRequest.getRealPath("eventImgFileUpload/");
		boolean isUpload = false;
		Iterator<String> params = mRequest.getFileNames();
		String[] eimage = new String[1];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			eimage[idx] = mFile.getOriginalFilename(); 
			if(eimage[idx]!=null && !eimage[idx].equals("")) {
				if(new File(uploadPath + eimage[idx]).exists()) {
					// 서버에 같은 파일이름이 있을 경우(첨부파일과)
					eimage[idx] = System.currentTimeMillis() + "_" + eimage[idx];
				}//if
				try {
					mFile.transferTo(new File(uploadPath+eimage[idx]));
					System.out.println("Server file : " + uploadPath + eimage[idx]);
					System.out.println("Backup file : " + backupPath + eimage[idx]);
					isUpload = filecopy(uploadPath + eimage[idx], backupPath + eimage[idx]);
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
			}
		}
		event.setEimage(eimage[0]); // 첫번째 첨부한 파일 이름
		return eventDao.modifyEvent(event);
	}
	@Override
	public int deleteEvent(int eid) {
		return eventDao.deleteEvent(eid);
	}
	@Override
	public int step5BeforeDeleteGroup(int gid) {
		if (eventDao.step5BeforeDeleteGroup(gid) == 1) {
			return 1;
		} else {
			return 0;
		}
	}
}

