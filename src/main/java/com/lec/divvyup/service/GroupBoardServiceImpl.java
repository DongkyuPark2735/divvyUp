package com.lec.divvyup.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.dao.GroupBoardDao;
import com.lec.divvyup.vo.GroupBoard;
import com.lec.divvyup.vo.GroupDetail;

@Service
public class GroupBoardServiceImpl implements GroupBoardService {

	String backupPath = "C:\\Users\\User\\Desktop\\divvyUpDKBranch\\divvyUp\\src\\main\\webapp\\groupFileBoardUploadFiles\\";

	static ArrayList<String> mlist;
	
	@Autowired
	private GroupBoardDao groupBoardDao; 
	
	@Autowired
	private GroupDetailService groupDetailService; 
	
	@Autowired
	ServletContext application;
	
	@Override
	public void insertGroupboard(GroupBoard groupBoard, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("groupFileBoardUploadFiles/");
		Iterator<String> params = mRequest.getFileNames(); 
		String[] bimg = {"",""}; 
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); 
			bimg[idx] = mFile.getOriginalFilename();
			if(bimg[idx] != null && !bimg[idx].equals("")) {
				if(new File(uploadPath+bimg[idx]).exists()) {
					bimg[idx] = System.currentTimeMillis()+"_"+bimg[idx];
				}
				try {
					mFile.transferTo(new File(uploadPath + bimg[idx]));
					System.out.println("서버파일 : "+uploadPath + bimg[idx]);
					System.out.println("백업파일 : "+backupPath + bimg[idx]);
					boolean result = filecopy(uploadPath + bimg[idx], backupPath+bimg[idx]);
					System.out.println(result==true? idx + "번째 백업성공":idx+"번째 백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				bimg[idx] = ""; 
			}
			idx++;
		}//whlie
		groupBoard.setGbfilename(bimg[0]); 
		groupBoardDao.insertGroupboard(groupBoard);
	}

	@Override
	public int deleteGroupboard(int gbid) {
		return groupBoardDao.deleteGroupboard(gbid);
	}

	@Override
	public List<GroupBoard> listLatest20Groupboard(int gid, HttpSession session) {
		mlist = new ArrayList<String>();
		String mid = (String)session.getAttribute("sesiongMid");
		
		//그룹 디테일 들어온 회원 application에 입력
		String tempMid = (String)application.getAttribute(mid);
		if(tempMid == null) {
		//어플리케이션에 mid 넣음// 기존에 있으면 안넣음
			application.setAttribute(mid, mid);
		}
		Enumeration<String> appMlists = application.getAttributeNames();
		ArrayList<GroupDetail> gd = (ArrayList<GroupDetail>)groupDetailService.groupDetailList(gid);
		// 그룹 맴버리스트와 어플리케이션 리스트의 맴버이름과 같은 회원만 milst에 넣음 
		while(appMlists.hasMoreElements()){
			String appMid = appMlists.nextElement();
			Object attrValue = application.getAttribute(appMid);
			//접속한 mid값들 
			for(GroupDetail glist : gd) {
				if(glist.getMid().equals(attrValue)) {
					mlist.add(glist.getMid());
				}
			}
		}
		application.setAttribute("sessionMList", mlist);
		
		List<GroupBoard> glist = groupBoardDao.listLatest20Groupboard(gid);
		return glist;
	}

	@Override
	public List<GroupBoard> listPast20Groupboard(GroupBoard groupBoard) {
		List<GroupBoard> pastGList = groupBoardDao.listPast20Groupboard(groupBoard);
		return pastGList;
	}

	@Override
	public GroupBoard singleLatestGroupboard(int gid) {
		application.setAttribute("sessionMList", mlist);
		GroupBoard gbBoarad = groupBoardDao.singleLatestGroupboard(gid);
		return gbBoarad;
	}

	@Override
	public GroupBoard getGroupboardVO(String mid) {
		return null;
	}
	
	private boolean filecopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		FileInputStream is = null; 
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int)file.length()];
			
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1)break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
	
}
