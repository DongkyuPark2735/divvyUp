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

import com.lec.divvyup.dao.GroupsDao;
import com.lec.divvyup.vo.Groups;
import com.lec.divvyup.vo.Member;

@Service
public class GroupsServiceImpl implements GroupsService {

@Autowired
private GroupsDao groupsDao;
String backupPath = "C:\\Users\\Unie\\Documents\\DivvyUpTeamUnie\\divvyUp\\src\\main\\webapp\\groupsImgFileUpload\\";
	@Override
	public Groups groupInfo(int gid) {
		return groupsDao.groupInfo(gid);
	}
	@Override
	public List<Groups> groupList(String mid) {
		return groupsDao.groupList(mid);
	}
	@Override
	public int nextGid() {
		return groupsDao.nextGid();
	}
	@Override
	public List<Member> followList(String mid) {
		return groupsDao.followList(mid);
	}
	
	@Override
	public int groupInsert(Groups groups, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("groupsImgFileUpload/");
		boolean isUpload = false;
		Iterator<String> params = mRequest.getFileNames();
		String[] gimg = new String[1];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			gimg[idx] = mFile.getOriginalFilename(); 
			if(gimg[idx]!=null && !gimg[idx].equals("")) {
				if(new File(uploadPath + gimg[idx]).exists()) {
					gimg[idx] = System.currentTimeMillis() + "_" + gimg[idx];
				}
				try {
					mFile.transferTo(new File(uploadPath+gimg[idx]));
					System.out.println("서버파일 : " + uploadPath + gimg[idx]);
					System.out.println("백업파일 : " + backupPath + gimg[idx]);
					isUpload = filecopy(uploadPath + gimg[idx], backupPath + gimg[idx]);
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
			}
			idx++;
		}
		groups.setGimg(gimg[0]);
		return groupsDao.groupInsert(groups);
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
	public int modify(MultipartHttpServletRequest mRequest, Groups groups) {
		String uploadPath = mRequest.getRealPath("groupsImgFileUpload/");
		boolean isUpload = false;
		Iterator<String> params = mRequest.getFileNames();
		String[] gimg = new String[1];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			gimg[idx] = mFile.getOriginalFilename(); 
			if(gimg[idx]!=null && !gimg[idx].equals("")) {
				if(new File(uploadPath + gimg[idx]).exists()) {
					gimg[idx] = System.currentTimeMillis() + "_" + gimg[idx];
				}
				try {
					mFile.transferTo(new File(uploadPath+gimg[idx]));
					System.out.println("서버파일 : " + uploadPath + gimg[idx]);
					System.out.println("백업파일 : " + backupPath + gimg[idx]);
					isUpload = filecopy(uploadPath + gimg[idx], backupPath + gimg[idx]);
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
			}
			idx++;
		}
		groups.setGimg(gimg[0]);
		return groupsDao.modify(groups);
	}
	@Override
	public int finalStepDeleteGroup(int gid) {
		if (groupsDao.finalStepDeleteGroup(gid) == 1) {
			return 1;
		} else {
			return 0;
		}
	}
}
